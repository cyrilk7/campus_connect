import 'package:campus_connect/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/function.dart';
import '../providers/provider.dart';
import 'feed.dart';

String name = "";
String major = "";
String residence = "";
String DOB = "";
String food = "";
String movie = "";
String id = "";
String yearGroup = "";
String email = "";
String gender = "";

final TextEditingController c_DOB = TextEditingController();
// final TextEditingController lastname = TextEditingController();
final TextEditingController c_major = TextEditingController();
final TextEditingController c_yearGroup = TextEditingController();
final TextEditingController c_residence = TextEditingController();
final TextEditingController c_favoriteMovie = TextEditingController();
final TextEditingController c_favoriteFood = TextEditingController();
final TextEditingController c_gender = TextEditingController();

class ViewProfiPage extends StatelessWidget {
  const ViewProfiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    name = Provider.of<MyProvider>(context, listen: false).temp_firstname + " " + Provider.of<MyProvider>(context, listen: false).temp_lastname;
    major = Provider.of<MyProvider>(context, listen: false).temp_major;
    residence = Provider.of<MyProvider>(context, listen: false).temp_residence;
    DOB = Provider.of<MyProvider>(context, listen: false).temp_DOB;
    food = Provider.of<MyProvider>(context, listen: false).temp_food;
    movie = Provider.of<MyProvider>(context, listen: false).temp_movie;
    id = Provider.of<MyProvider>(context, listen: false).temp_ID;
    yearGroup = Provider.of<MyProvider>(context, listen: false).temp_year;
    email = Provider.of<MyProvider>(context, listen: false).temp_mail;
    gender = Provider.of<MyProvider>(context, listen: false).temp_gender;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(right: 20),
                child: const Image(
                  color: Colors.orange,
                    image: AssetImage('images/sign_in_logo.png'),
                  fit: BoxFit.contain,
                  height: kToolbarHeight * 1.1,
                ),
              ),
              Text(
                "Campus Connect",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              Center(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 300),
                    child: Text(
                      'Welcome!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800
                        )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/profile-img.png"),
                      radius: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: "Agane",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      major + " Major",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(154, 144, 144, 2)),
                    ),
                    SizedBox(height: 20,),
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
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(154, 144, 144, 2),
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
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(154, 144, 144, 2)),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FeedPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left:30, top: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.grey,
                      height: 2,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
