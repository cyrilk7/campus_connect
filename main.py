import datetime
from email.message import EmailMessage
import json
import firebase_admin
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore
from google.cloud.firestore_v1 import SERVER_TIMESTAMP
import pytz
from flask_cors import CORS
import smtplib


app = Flask(__name__)
CORS(app)
cred = credentials.Certificate("social-media-web-app-a55a3-firebase-adminsdk-9fksi-2163f581a4.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

#PROGRESS SO FAR. API HAS BEEN COMPLETED

USER_COLLECTION = db.collection('Users')
APP_FEED = db.collection('Feed')
mail_reference = db.collection('mail')
#
# @functions_framework.http
# def test_function(request):
#     if request.method == 'POST' and request.path == '/profile':
#         return create_profile()
#
#     if request.method == 'PATCH' and request.path == '/profile':
#         return update_profile()
#
#     if request.method == 'GET' and request.path == '/profile':
#         return load_profile()
#
#     if request.method == 'POST' and request.path == '/feed':
#         return create_post()
#
#     if request.method == 'GET' and request.path == '/feed':
#         return get_feed()


def get_time():
    # Get the current time in UTC timezone
    now_ut = datetime.datetime.now(tz=pytz.utc)

    # Convert the UTC time to GMT timezone
    tz = pytz.timezone('GMT')
    now_gmt = now_ut.astimezone(tz)
    date_string = now_gmt.strftime('%Y-%m-%d %H:%M:%S')
    return date_string

"""This function creates a new profile for a user and stores it in the firestore database"""
@app.route('/profile', methods=['POST'])
def create_profile():
    user_info = json.loads(request.data)

    if 'email' not in user_info:
        return jsonify({"error": "Missing field email"}), 400

    user = USER_COLLECTION.document(user_info.get("email"))

    if user.get().exists:
        return jsonify({"error": "There is already an account associated with this email"}), 400

    else:
        user.set(user_info)
        return jsonify(user_info), 201

"""This function updates a users profile"""
@app.route('/profile', methods=['PATCH'])
def update_profile():
    updated_info = json.loads(request.data)

    if 'email' not in updated_info:
        return jsonify({"error": "Missing field email"})

    user = USER_COLLECTION.document(updated_info.get("email"))

    if user.get().exists:
        if 'DOB' in updated_info:
            user.update({
                "DOB": updated_info.get("DOB")
            })
        if 'Yeargroup' in updated_info:
            user.update({
                "Yeargroup": updated_info.get("Yeargroup")
            })
        if 'Major' in updated_info:
            user.update({
                'Major': updated_info.get('Major')
            })

        if 'Campus Residence' in updated_info:
            user.update({
                'CampusResidence': updated_info.get('CampusResidence')
            })

        if 'FavoriteMovie' in updated_info:
            user.update({
                'FavoriteMovie': updated_info.get('FavoriteMovie')
            })

        if 'Favorite Food' in updated_info:
            user.update({
                'FavoriteFood': updated_info.get('FavoriteFood')
            })

    else:
        return jsonify({"error":"Record not found"}), 400

    return jsonify(updated_info), 200


"""This methods returns a user's information"""
@app.route('/profile', methods = ['GET'])
def load_profile():
    user_email = request.args.get("email")

    user = USER_COLLECTION.document(user_email)

    if user.get().exists:
        return jsonify(user.get().to_dict())

    else:
        return jsonify({"error": "Record not found"}), 404
# app.run(debug=True)

@app.route('/feed', methods = ['POST'])
def create_post():
    user_post = json.loads(request.data)
    email = user_post["email"]
    timestamp = datetime.datetime.now()

    if 'email' not in user_post:
        return jsonify({"error": "Missing field email"})

    user = USER_COLLECTION.document(user_post.get("email"))
    # feed = APP_FEED.document(timestamp.strftime('%Y-%m-%d %H:%M:%S'))
    feed = APP_FEED.document(get_time())

    if user.get().exists:
        feed.set(user_post)
        feed.update({
            "timestamp": get_time()
        })


        notify_users(email)
        return jsonify(user_post), 201
    else:
        return jsonify({"error": "Unregistered user"})


@app.route('/feed', methods=['GET'])
def get_feed():
    query = APP_FEED.order_by('timestamp', direction=firestore.Query.DESCENDING).get()
    temp = []

    for post in query:
        temp.append(post.to_dict())

    # json_string = json.dumps(temp, indent=4)
    return jsonify(temp)


@app.route("/login", methods=["POST"])
def login_profile():
    credentials = json.loads(request.data)

    profile = db.collection('Users').document(credentials['email']).get()


    if profile.exists:
        firstname = profile.to_dict().get('Firstname')
        lastname = profile.to_dict().get('Lastname')
        major = profile.to_dict().get('Major')
        email = profile.to_dict().get('email')
        DOB = profile.to_dict().get("DOB")
        YearGroup = profile.to_dict().get('YearGroup')
        FavoriteMovie = profile.to_dict().get("FavoriteMovie")
        FavoriteFood = profile.to_dict().get("FavoriteFood")
        CampusResidence = profile.to_dict().get("CampusResidence")
        ID = profile.to_dict().get("StudentID")
        gender = profile.to_dict().get("Gender")
    
        
        
        if profile.to_dict()['password'] == credentials['password']:
            return jsonify({
                'Success': True, 
                "Message": "Logged In", 
                "Firstname": firstname, 
                "Lastname": lastname, 
                "Major": major, 
                "email": email,
                "DOB" : DOB,
                "YearGroup": YearGroup,
                "FavoriteMovie": FavoriteMovie,
                "FavoriteFood": FavoriteFood,
                "CampusResidence": CampusResidence,
                "StudentID": ID,
                "Gender": gender
                }), 200
        else:
            return jsonify({'Success':False, "Error":'Incorrect email or password'}), 404

    else:
        return jsonify({'Success': False, "Error": 'User not found'}), 404




def notify_users(email):
    all_emails = db.collection("Users")
    email_list = []
    student_mail = email
    for student_email in all_emails.get():
        student_email = student_email.to_dict()["email"]
        email_list.append(student_email)
    
    # student_ref = USER_COLLECTION.document(student_mail)
    student_details = USER_COLLECTION.document(student_mail).get().to_dict()
    student_fullname = student_details["Firstname"] + " "+ student_details["Lastname"]
    for email in email_list:
        
        new_email = mail_reference.document()
        new_email.set(
            {
             "to":email,
             "message":{
                "subject": "New post by " + student_fullname + "!",
                "text":  "Login into your account to see the post" 
             }
       }
    )


# app.run(debug=True)4
