import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:campus_connect/pages/feed.dart';
import 'package:campus_connect/pages/view_others.dart' as others;
import 'package:campus_connect/pages/view_profile.dart';
import 'package:quickalert/quickalert.dart';
import '../pages/login.dart';
import '../pages/view_others.dart';
import '../pages/view_profile.dart';
import '../providers/provider.dart';

final TextEditingController post = TextEditingController();

Future<void> SignUp(BuildContext context, data) async {
  var url = Uri.https("elections-b.uc.r.appspot.com", "/profile");
  var request = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );

  print(request.statusCode);
  if (request.statusCode == 201) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Sign Up Completed Successfully!',
    );
  } else {
    var message = "Sign up was unsuccessful";
    // dialogBox(context, title, message);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }
}

Future<void> makePost(BuildContext context, data) async {
  var url = Uri.https("elections-b.uc.r.appspot.com", "/feed");
  var request = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );

  print(request.statusCode);
  if (request.statusCode == 201) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FeedPage()));
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'New Post Created Successfully!',
    );
  } else {
    var message = "Post was unsuccessful";
    // dialogBox(context, title, message);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }
}

Future<void> editProfile(BuildContext context, data) async {
  var url = Uri.https("elections-b.uc.r.appspot.com", "/profile");
  var request = await http.patch(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );

  print(request.statusCode);
  if (request.statusCode == 200) {
    // dialogBox(context, "Success", "Profile Updated");
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Profile Edited Successfully!',
    );
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ViewProfilePage()));
  } else {
    var message = "Post was unsuccessful";
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }
}

void dialogBox(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Exit'))
          ],
        );
      });
}

Future<Map<String, dynamic>> getDetails(
    BuildContext context, String email) async {
  var url = Uri.https("elections-b.uc.r.appspot.com", "/profile", {"email": email});
  var request = await http.get(
    url,
    headers: {'Content-type': 'application/json'},
  );

  print(request.statusCode);
  var responseBody = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return responseBody;
  }
  if (request.statusCode == 404){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: 'Error: User Not Found',
    );
    return {};
  }
  else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: 'Unexpected event',
    );
    return {};
  }
}



Future<void> login(BuildContext context, data) async {
  var url = Uri.https("elections-b.uc.r.appspot.com", "/login");
  var request = await http.post(
    url,
    headers: {'Content-type': 'application/json'},
    body: jsonEncode(data),
  );

  print(request.statusCode);

  var responseBody = jsonDecode(request.body);
  if (!responseBody["Success"]) {
    // dialogBox(context, "Error", "Incorrect email or password");
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: 'Incorrect Email or Password',
    );
  }
  if (responseBody["Success"]) {
    Provider.of<MyProvider>(context, listen: false).temp_mail =
        responseBody["email"];
    Provider.of<MyProvider>(context, listen: false).temp_firstname =
        responseBody["Firstname"];
    Provider.of<MyProvider>(context, listen: false).temp_lastname =
        responseBody["Lastname"];
    Provider.of<MyProvider>(context, listen: false).temp_major =
        responseBody["Major"];
    Provider.of<MyProvider>(context, listen: false).temp_residence =
        responseBody["CampusResidence"];
    Provider.of<MyProvider>(context, listen: false).temp_DOB =
        responseBody["DOB"];
    Provider.of<MyProvider>(context, listen: false).temp_food =
        responseBody["FavoriteFood"];
    Provider.of<MyProvider>(context, listen: false).temp_movie =
        responseBody["FavoriteMovie"];
    Provider.of<MyProvider>(context, listen: false).temp_year =
        responseBody["YearGroup"];
    Provider.of<MyProvider>(context, listen: false).temp_ID =
        responseBody["StudentID"];
    Provider.of<MyProvider>(context, listen: false).temp_gender =
        responseBody["Gender"];
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Welcome',
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FeedPage()));
  } else {
    // dialogBox(context, "Error", "Incrrect email or password");
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: 'Error, Incorrect email or password',
    );
  }
}

getFeed(context, email, message, time) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      // width: 100,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/profile-img.png"),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ViewOthersPage(email: email,)));
                      },
                      child: Text(
                        email,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Text(
                      " made a post",
                      style: TextStyle(
                          // fontWeight: FontWeight.w100,
                          color: Color.fromRGBO(154, 144, 144, 2),
                          fontSize: 14),
                    ),
                    // SizedBox(width: 200,),

                  ],
                ),
                Text(
                  time,
                  style: TextStyle(
                    // fontWeight: FontWeight.w100,
                      color: Color.fromRGBO(154, 144, 144, 2),
                      fontSize: 14),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

getMyFeed(context, email, message, time) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      // width: 100,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/profile-img.png"),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ViewProfilePage()));
                      },
                      child: Text(
                        email,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Text(
                      " made a post",
                      style: TextStyle(
                        // fontWeight: FontWeight.w100,
                          color: Color.fromRGBO(154, 144, 144, 2),
                          fontSize: 14),
                    ),
                    // SizedBox(width: 200,),

                  ],
                ),
                Text(
                  time,
                  style: TextStyle(
                    // fontWeight: FontWeight.w100,
                      color: Color.fromRGBO(154, 144, 144, 2),
                      fontSize: 14),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void showEditModal(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: BoxConstraints(maxHeight: 500, maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image.asset("images/sign_in_logo.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Edit Your Profile",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 63, 180, 231),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // const Text(
                          //   "Let's get you all signed up!",
                          //   textAlign: TextAlign.left,
                          //   style: TextStyle(
                          //     fontSize: 17,
                          //     fontWeight: FontWeight.bold,
                          //     color: Color.fromARGB(109, 0, 0, 0),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const Text(
                      "Date of Birth",
                      style: TextStyle(
                          fontFamily: 'Agane',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        // controller: ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'dd/mm/yy',
                          hintStyle: TextStyle(
                              fontFamily: 'Agane',
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Major",
                      style: TextStyle(
                          fontFamily: 'Agane',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Business Administration',
                          hintStyle: TextStyle(
                              fontFamily: 'Agane',
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Year Group",
                      style: TextStyle(
                          fontFamily: 'Agane',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '2000',
                          hintStyle: TextStyle(
                              fontFamily: 'Agane',
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Gender",
                      style: TextStyle(
                          fontFamily: 'Agane',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Male',
                          hintStyle: TextStyle(
                              fontFamily: 'Agane',
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Campus Residence",
                      style: TextStyle(
                          fontFamily: 'Agane',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'On-Campus',
                          hintStyle: TextStyle(
                              fontFamily: 'Agane',
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Favorite Food",
                      style: TextStyle(
                          fontFamily: 'Agane',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Rice',
                          hintStyle: TextStyle(
                              fontFamily: 'Agane',
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Favorite Movie",
                      style: TextStyle(
                          fontFamily: 'Agane',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Creed II',
                          hintStyle: TextStyle(
                              fontFamily: 'Agane',
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              // Perform some action when the button is presse
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text('Edit'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

void showCreateModal(context) {
  String email = Provider.of<MyProvider>(context, listen: false).temp_mail;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: BoxConstraints(maxHeight: 550, maxWidth: 550),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      // mAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            child: Image.asset("images/sign_in_logo.png")),
                        SizedBox(height: 20,),
                        Text(
                          "Create A Post",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    // width: 500,
                    child: TextFormField(
                      controller: post,
                      keyboardType: TextInputType.multiline,
                      expands: true,
                      // minLines: 1,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "What's on your mind?",
                        hintStyle: TextStyle(
                            fontFamily: 'Agane',
                            fontSize: 14,
                            color: Colors.black26),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform some action when the button is presse
                          makePost(context, {
                            "email": email,
                            "post": post.text,
                          });
                          post.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Post'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
