import 'package:flutter/material.dart';

import '../functions/function.dart';

TextEditingController mail = TextEditingController();
TextEditingController pass = TextEditingController();
String textValue = mail.text;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: loading
            ? CircularProgressIndicator(color: Colors.blueAccent,)
            : Stack(
              alignment: Alignment.center,
              children: [
                const Positioned.fill(
                  child: Image(
                    image: AssetImage('images/campus_scene.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  // Set the size and decoration of the container
                  width: 500,
                  height: 410,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // Add widgets inside the container
                  child: Column(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          child: Image.asset("images/sign_in_logo.png")),
                      // const SizedBox(
                      //   height: 100,
                      // ),
                      const Text(
                        "Campus Connect",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 10,),
                      const Text(
                        "Let's get you signed in!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color.fromARGB(109, 0, 0, 0)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(109, 0, 0, 0)
                            ),),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: 350,
                            height: 40,
                            child: TextFormField(
                              controller: mail,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(

                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(109, 0, 0, 0)
                            ),),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: 350,
                            height: 40,
                            child: TextFormField(
                              obscureText: true,
                              controller: pass,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                loading = true;
                              });
                              // Perform some action when the button is pressed
                              login(context, {
                                "email": mail.text,
                                "password": pass.text
                              });
                              pass.clear();
                              setState(() {
                                loading = false;
                              });
                            },
                            child: Text('Submit'),
                            style:ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}


