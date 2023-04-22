import 'package:campus_connect/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/function.dart';
import '../providers/provider.dart';
import 'feed.dart';
import 'login.dart';

// String name = "";
// String major = "";
// String residence = "";
// String DOB = "";
// String food = "";
// String movie = "";
// String id = "";
// String yearGroup = "";
String email = "";
// String gender = "";

final TextEditingController c_DOB = TextEditingController();
final TextEditingController c_lastname = TextEditingController();
final TextEditingController c_major = TextEditingController();
final TextEditingController c_yearGroup = TextEditingController();
final TextEditingController c_residence = TextEditingController();
final TextEditingController c_favoriteMovie = TextEditingController();
final TextEditingController c_favoriteFood = TextEditingController();
final TextEditingController c_gender = TextEditingController();
final TextEditingController c_firstname = TextEditingController();
final TextEditingController c_id = TextEditingController();
final TextEditingController c_email = TextEditingController();

class ViewProfilePage extends StatelessWidget {
  const ViewProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstname = Provider.of<MyProvider>(context, listen: false).temp_firstname;
    String id = Provider.of<MyProvider>(context, listen: false).temp_ID;

    String lastname = Provider.of<MyProvider>(context, listen: false).temp_lastname;
    String email = Provider.of<MyProvider>(context, listen: false).temp_mail;
    String major = Provider.of<MyProvider>(context, listen: false).temp_major;
    String gender = Provider.of<MyProvider>(context, listen: false).temp_gender;
    String DOB = Provider.of<MyProvider>(context, listen: false).temp_DOB;
    String yearGroup = Provider.of<MyProvider>(context, listen: false).temp_year;
    String residence = Provider.of<MyProvider>(context, listen: false).temp_residence;
    String favMovie = Provider.of<MyProvider>(context, listen: false).temp_movie;
    String favFood = Provider.of<MyProvider>(context, listen: false).temp_food;

    // Future<Map<String, dynamic>> userData = getDetails(context, email);
    //
    // userData.then((value) {
    //   c_gender.text = value['Gender'];
    //   c_major.text = value['Major'];
    //   c_residence.text = value['Campus Residence'];
    //   c_favoriteFood.text = value['Favorite Food'];
    //   c_favoriteMovie.text = value['Favorite Movie'];
    //   c_DOB.text = value['DOB'];
    //   c_yearGroup.text = value['YearGroup'];
    // });

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blueAccent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset("images/sign_in_logo.png"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Hi " + firstname + "!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Here are some stats",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "112",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "177",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        color: Color.fromRGBO(245, 245, 245, 255),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewProfilePage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          firstname = "";
                          id = "";
                          lastname = "";
                          email = "";
                          major = "";
                          gender = "";
                          DOB = "";
                          yearGroup = "";
                          residence = "";
                          favMovie = "";
                          favFood = "";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));

                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
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
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Color.fromRGBO(37, 150, 190, 255),
                  child: Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 70),
                          child: Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Date of Birth: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Gender: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Major: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Year Group: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Residence: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text(
                                  "Favorite Food: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text(
                                  "Favorite Movie: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent
                                  ),
                                ),
                                SizedBox(height: 20,),

                              ],
                            ),
                            SizedBox(width: 50,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DOB,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  gender,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  major,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  yearGroup,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  residence,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text(
                                  favFood,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text(
                                  favMovie,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(height: 20,),

                              ],
                            ),
                            Container(
                              // margin: EdgeInsets.only(bottom: 400, left: 100),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage("images/profile-img.png"),
                                    radius: 100,
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                      firstname + " " + lastname,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    id + "/" + email,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(width: 70,),
                            GestureDetector(
                              onTap: (){
                                Future<Map<String, dynamic>> userData = getDetails(context, email);

                                userData.then((value) {
                                  c_gender.text = value['Gender'];
                                  c_major.text = value['Major'];
                                  c_residence.text = value['CampusResidence'];
                                  c_favoriteFood.text = value['FavoriteFood'];
                                  c_favoriteMovie.text = value['FavoriteMovie'];
                                  c_DOB.text = value['DOB'];
                                  c_yearGroup.text = value['YearGroup'];
                                  c_firstname.text = value["Firstname"];
                                  c_lastname.text = value["Lastname"];
                                  c_email.text = value["email"];

                                });
                                showEditModal(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 200, bottom: 260),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blueAccent,
                                  size: 30,
                                ),
                              ),
                            )
                          ],),

                        ),
                        Divider(height: 100, color: Colors.blueAccent,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
                        controller: c_DOB,
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
                        controller: c_major,
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
                        controller: c_yearGroup,
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
                        controller: c_gender,
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
                        controller: c_residence,
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
                        controller: c_favoriteFood,
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
                        controller: c_favoriteMovie,
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
                              editProfile(context, {
                                "email": c_email.text,
                                "YearGroup": c_yearGroup.text,
                                "Major": c_major.text,
                                "DOB": c_DOB.text,
                                "Gender": c_gender.text,
                                "CampusResidence": c_residence.text,
                                "FavoriteFood": c_favoriteFood.text,
                                "FavoriteMovie": c_favoriteFood.text,
                              });
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