import 'package:campus_connect/pages/sign_up.dart';
import 'package:flutter/material.dart';
final TextEditingController firstname = TextEditingController();
final TextEditingController lastname = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Image.asset("images/sign_in_logo.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Welcome to Campus Connect",
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
                    const Text(
                      "Let's get you all signed up!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(109, 0, 0, 0),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Firstname",
                                    style: TextStyle(
                                        fontFamily: 'Agane',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color.fromRGBO(154, 144, 144, 2)
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  SizedBox(
                                    height: 40,
                                    width: 300,
                                    child: TextFormField(
                                      controller: firstname,
                                      decoration: const InputDecoration(
                                        // labelText: "Firstname",
                                        border: OutlineInputBorder(),
                                        hintText: 'John',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Agane',
                                            fontSize: 14,
                                            color: Colors.black26
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.cente,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lastname",
                                    style: TextStyle(
                                        fontFamily: 'Agane',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color.fromRGBO(154, 144, 144, 2)
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  SizedBox(
                                    height: 40,
                                    width: 300,
                                    child: TextFormField(
                                      controller: lastname,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Doe',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Agane',
                                            fontSize: 14,
                                            color: Colors.black26
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontFamily: 'Agane',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromRGBO(154, 144, 144, 2)
                            ),
                          ),
                          SizedBox(height: 15,),
                          SizedBox(
                            width: 600,
                            height: 40,
                            child: TextFormField(
                              controller: email,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "john.doe@example.com",
                                hintStyle: TextStyle(
                                    fontFamily: 'Agane',
                                    fontSize: 14,
                                    color: Colors.black26
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(
                                fontFamily: 'Agane',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromRGBO(154, 144, 144, 2)
                            ),
                          ),
                          SizedBox(height: 15,),
                          SizedBox(
                            width: 600,
                            height: 40,
                            child: TextFormField(
                              obscureText: true,
                              controller: password,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "****",
                                hintStyle: TextStyle(
                                    fontFamily: 'Agane',
                                    fontSize: 14,
                                    color: Colors.black26
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform some action when the button is pressed
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
                          },
                          child: Text('Submit'),
                          style:ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
              flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/campus_scene2.jpg"),
                      fit: BoxFit.cover
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}


