import 'package:flutter/material.dart';

class ViewProfilePage extends StatelessWidget {
  const ViewProfilePage({Key? key}) : super(key: key);

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
                    // Container(
                    //   height: 2,
                    //   color: Colors.grey,
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 20),
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
                    SizedBox(
                      height: 20,
                    ),
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
                    SizedBox(
                      height: 20,
                    ),
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
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          height: 450,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("images/profile-img.png"),
                                      radius: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Cyril Kujar",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "62012024/cyril.kujar@ashesi.edu.gh",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                154, 144, 144, 2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                color: Colors.grey,
                                height: 2,

                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "DOB",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),

                                        ),
                                        SizedBox(height: 25,),
                                        Text(
                                          "Gender",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),

                                        ),
                                        SizedBox(height: 25,),
                                        Text(
                                          "Year Group",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        SizedBox(height: 25,),
                                        Text(
                                          "Major",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        SizedBox(height: 25,),
                                        Text(
                                          "Residence",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        SizedBox(height: 25,),
                                        Text(
                                          "Favorite Food",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        SizedBox(height: 25,),
                                        Text(
                                          "Favorite Movie",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 50),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "11/04/88",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),

                                          ),
                                          SizedBox(height: 25,),
                                          Text(
                                            "Male",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),

                                          ),
                                          SizedBox(height: 25,),
                                          Text(
                                            "2024",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 25,),
                                          Text(
                                            "Computer Science",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 25,),
                                          Text(
                                            "Off-Campus",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 25,),
                                          Text(
                                            "Rice",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 25,),
                                          Text(
                                            "Creed",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ],

                          ),
                        ),

                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
