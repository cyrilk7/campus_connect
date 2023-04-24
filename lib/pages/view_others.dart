import 'package:campus_connect/pages/sign_up.dart';
import 'package:campus_connect/pages/view_profile.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/function.dart';
import '../providers/provider.dart';
import 'feed.dart';
import 'login.dart';

String firstname = "";
String lastname = "";
String major = "";
String residence = "";
String DOB = "";
String favFood = "";
String favMovie = "";
String id = "";
String yearGroup = "";
String email = "";
String gender = "";

final List<String> genderList = ['Female', 'Male'];
final List<String> residenceList = ['On campus', 'Off campus'];
final List<String> majorList = [
  'Computer Science',
  'Computer Engineering',
  'Electrical Engineering',
  'Mechanical Engineering',
  'Business Administration',
  'Management Info Systems',
];

String? majorPick;
String? residencePick;
String? genderPick;

class ViewOthersPage extends StatefulWidget {
  final String email;
  const ViewOthersPage({super.key, required this.email});



  @override
  State<ViewOthersPage> createState() => _ViewOthersPageState();
}

class _ViewOthersPageState extends State<ViewOthersPage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getDetails(context, widget.email),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        else{
          if (snapshot.data == null){
            return const Scaffold(
              body: Center(
                child: Text('No data was found'),
              ),
            );
          }else{
            firstname = snapshot.data!['Firstname'] ?? '';
            lastname = snapshot.data!['Lastname'] ?? '';
            major = snapshot.data!['Major'] ?? '';
            yearGroup = snapshot.data!['YearGroup'] ?? '';
            residence = snapshot.data!['CampusResidence']?? '';
            DOB = snapshot.data!['DOB']?? '';
            favFood = snapshot.data!['FavoriteFood']?? '';
            favMovie = snapshot.data!['FavoriteMovie']?? '';
            id = snapshot.data!['StudentID']?? '';
            email = snapshot.data!['email']?? '';
            gender = snapshot.data!['Gender']?? '';

          }
        }
        return MaterialApp(
          home: Scaffold(
            body: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
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
                              // fontWeight: FontWeight.bold,
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
                                        fontSize: 17,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Posts",
                                    style: TextStyle(
                                      fontSize: 12,
                                      // fontWeight: FontWeight.bold,
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
                                      fontSize: 17,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
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
                            onTap: () {
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
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Color.fromRGBO(37, 150, 190, 255),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50, right: 40, top: 40),
                              child: Row(
                                children: [
                                  Text(
                                    "User ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),

                            Container(
                              padding: const EdgeInsets.all(40.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    //<-- SEE HERE
                                    color: Colors.blueAccent,
                                    blurRadius: 100.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Card(
                                  elevation: 50,
                                  shadowColor: Colors.black,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    //<-- SEE HERE
                                      side: BorderSide(
                                        // color: Colors.blueAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 70),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Date of Birth: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.blueAccent),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Gender: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.blueAccent),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Major: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.blueAccent),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Year Group: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.blueAccent),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Residence: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.blueAccent),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Favorite Food: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.blueAccent),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Favorite Movie: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.blueAccent),
                                            ),
                                            // SizedBox(height: 20,),
                                          ],
                                        ),
                                        // SizedBox(width: 50,),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DOB,
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Color.fromRGBO(
                                                      154, 144, 144, 2)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              gender,
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Color.fromRGBO(
                                                      154, 144, 144, 2)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              major,
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color:
                                                Color.fromRGBO(154, 144, 144, 2),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              yearGroup,
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color:
                                                Color.fromRGBO(154, 144, 144, 2),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              residence,
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color:
                                                Color.fromRGBO(154, 144, 144, 2),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              favFood,
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Color.fromRGBO(
                                                      154, 144, 144, 2)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              favMovie,
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color:
                                                Color.fromRGBO(154, 144, 144, 2),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(bottom: 400, left: 100),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "images/profile-img.png"),
                                                radius: 100,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    firstname + " ",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17,
                                                        color: Colors.blueAccent),
                                                  ),
                                                  Text(
                                                    lastname,
                                                    style: TextStyle(
                                                      // fontWeight: FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    id + "/",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17,
                                                      color: Colors.blueAccent,
                                                    ),
                                                  ),
                                                  Text(
                                                    email,
                                                    style: TextStyle(fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(width: 70,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Divider(
                            //   height: 100,
                            //   color: Colors.blueAccent,
                            // ),
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
      },
    );
  }
}

