import 'package:flutter/material.dart';
import 'package:campus_connect/functions/function.dart';
import 'package:campus_connect/pages/register.dart' as register;
import 'package:dropdown_button2/dropdown_button2.dart';


// final TextEditingController email = TextEditingController();
final TextEditingController id = TextEditingController();

final TextEditingController DOB = TextEditingController();
// final TextEditingController lastname = TextEditingController();
final TextEditingController major = TextEditingController();
final TextEditingController yearGroup = TextEditingController();
final TextEditingController residence = TextEditingController();
final TextEditingController favoriteMovie = TextEditingController();
final TextEditingController favoriteFood = TextEditingController();
final TextEditingController gender = TextEditingController();


class DetailsPage extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
final List<String> residenceDropdown = [
  'on campus',
  'off campus'
];
final List<String> genderDropdown = [
  'M',
  'F'
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              // height: 10000,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/login-img.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 500,
                    // margin: EdgeInsets.only(left: 40, top: 100),
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "StudentID",
                                    style: TextStyle(
                                      fontFamily: 'Agane',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color.fromRGBO(154, 144, 144, 2)
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      controller: id,
                                      decoration: const InputDecoration(
                                        // labelText: "Firstname",
                                        border: OutlineInputBorder(),
                                        hintText: '00000',
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
                              width: 60,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Date of Birth",
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
                                    child: TextFormField(
                                      controller: DOB,
                                      decoration: const InputDecoration(
                                        // labelText: "LastName",
                                        border: OutlineInputBorder(),
                                        hintText: 'dd/mm/yy',
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
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Major",
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
                                    child: TextFormField(
                                      controller: major,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Business Administration',
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
                              width: 60,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Gender",
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
                                    child: TextFormField(
                                      controller: gender,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'M/F',
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
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Year Group",
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
                                    child: TextFormField(
                                      controller: yearGroup,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '2002',
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
                              width: 60,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Residence",
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
                                    child: TextFormField(
                                      controller: residence,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '2002',
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
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Favorite Food",
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
                                    child: TextFormField(
                                      controller: favoriteFood,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Rice',
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
                              width: 60,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Favorite Movie",
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
                                    child: TextFormField(
                                      controller: favoriteMovie,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Creed II',
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
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  height: 40,
                                  width: 10,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Perform some action when the button is pressed
                                      SignUp(context, {
                                        "email": register.email.text,
                                        "password": register.password.text,
                                        "StudentID": id.text,
                                        "Firstname": register.firstname.text,
                                        "Lastname": register.lastname.text,
                                        "Major": major.text,
                                        "Gender": gender.text,
                                        "YearGroup": yearGroup.text,
                                        "CampusResidence": residence.text,
                                        "FavoriteMovie": favoriteMovie.text,
                                        "FavoriteFood": favoriteFood.text,

                                      });
                                    },
                                    child: Text('Submit'),
                                  ),
                                ),
                              ),

                            ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}

// class MyApp extends StatelessWidget {
//   // const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Row(
//           children: <Widget>[
//             Expanded(
//               flex: 1,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("images/login-img.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Row(
//                 children: const <Widget>[
//
