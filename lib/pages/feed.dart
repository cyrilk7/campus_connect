import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 80, top: 10, bottom: 10, left: 10),
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
                    Icon(Icons.search, color: Colors.blueAccent,),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Container()
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
                    SizedBox(height: 20,),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/profile-img.png"),
                      radius: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Cyril Kujar",
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
                      "Computer Science Major",
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
                    Container(
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
                    SizedBox(height: 20,),
                    Container(
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
                    SizedBox(height: 20,),
                    Container(
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
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  color: Color.fromRGBO(37, 150, 190, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
                      const Text(
                        "New Activity",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),

                      ),
                      SizedBox(height: 20,),
                      Container(
                        // width: 100,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Row(
                                children: const [
                                  CircleAvatar(
                                    backgroundImage: AssetImage("images/profile-img.png"),
                                    radius: 20,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Cyril Kujar ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    ),
                                  ),
                                  Text(
                                    "made a post",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.w100,
                                        color: Color.fromRGBO(154, 144, 144, 2),
                                        fontSize: 14
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: const Text(
                                "The development of the profile functionalities should follow the REST architectural style."
                                    "That is, there should be appropriate REST APIs at the backend. The development of the profile functionalities should follow the REST architectural style."
                                    "That is, there should be appropriate REST APIs at the backend ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),

                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        // width: 100,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),

                    ],
                  ),


                ),)
          ],
        ),
      ),
    );
  }
}
