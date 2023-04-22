import 'package:campus_connect/pages/register.dart';
import 'package:campus_connect/pages/sign_up.dart';
import 'package:campus_connect/pages/view.dart';
import 'package:campus_connect/pages/view_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:campus_connect/providers/provider.dart';
import 'package:provider/provider.dart';

import '../functions/function.dart';
import 'login.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection("Feed").snapshots();
  @override
  void initState(){
    super.initState();
    print("feedStream initialized");
  }

  @override
  Widget build(BuildContext context) {
    String name =
        Provider.of<MyProvider>(context, listen: false).temp_firstname;
    String email = Provider.of<MyProvider>(context, listen: false).temp_mail;
    String major = Provider.of<MyProvider>(context, listen: false).temp_major;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blueAccent,
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              const Text(
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
                      'Hello Buzzer!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 80, top: 10, bottom: 10, left: 10),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 300,
                height: 100,
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10.0,
              width: 100.0,
              margin: EdgeInsets.only(right: 100, top: 8, bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showCreateModal(context);
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                  Icon(
                    Icons.create,
                    color: Colors.grey[500],
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
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
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(fontSize: 15),
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
                        name = "";
                        email = "";
                        major = "";

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
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(fontSize: 15),
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
                margin: EdgeInsets.only(left: 50, right: 50),
                color: Color.fromRGBO(37, 150, 190, 255),
                child: StreamBuilder<QuerySnapshot>(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('Error: ${snapshot.error}')
                      );
                    }
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator(
                        color: Colors.blueAccent,
                      );
                    }
                    final list = snapshot.data!.docs;

                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            const Text(
                              "New Activity",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            // SingleChildScrollView(
                            //   child: Column(
                            //     children: [
                            for (var item in list.reversed)
                              getFeed(context, item["email"], item["post"]),
                            //     ]
                            //   ),
                            // ),
                            // Container(
                            //   // width: 100,
                            //   height: 200,
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(10)),
                            // ),
                          ],
                        ),
                      ),
                    );

                  }),
            )
            )],
        ),
      ),
    );
  }

}
