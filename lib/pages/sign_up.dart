import 'package:campus_connect/pages/view_profile.dart';
import 'package:campus_connect/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:campus_connect/functions/function.dart';
import 'package:campus_connect/pages/register.dart' as register;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';


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


class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // const MyApp({Key? key}) : super(key: key);

  // @override
  // void initState(){
  //   super.initState();
  //
  //   // majorPick = Provider.of<MyProvider>(context, listen:false).temp_major;
  //   // residencePick = Provider.of<
  //
  // }
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
                        "Enter your details",
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
                        width: 600,
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
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            hint: Text('Major'),
                                            items: majorList
                                                .map((item) => DropdownMenuItem<String>(
                                                value: item, child: Text(item)))
                                                .toList(),
                                            value: majorPick,
                                            onChanged: (value) {
                                              setState(() {
                                                majorPick = value;
                                              });
                                            },
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
                                      // SizedBox(
                                      //   height: 40,
                                      //   child: TextFormField(
                                      //     controller: gender,
                                      //     decoration: const InputDecoration(
                                      //       border: OutlineInputBorder(),
                                      //       hintText: 'M/F',
                                      //       hintStyle: TextStyle(
                                      //           fontFamily: 'Agane',
                                      //           fontSize: 14,
                                      //           color: Colors.black26
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            hint: Text('Gender'),
                                            items: genderList
                                                .map((item) => DropdownMenuItem<String>(
                                                value: item, child: Text(item)))
                                                .toList(),
                                            value: genderPick,
                                            onChanged: (value) {
                                              setState(() {
                                                genderPick = value;
                                              });
                                            },
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
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            hint: Text('Residence'),
                                            items: residenceList
                                                .map((item) => DropdownMenuItem<String>(
                                                value: item, child: Text(item)))
                                                .toList(),
                                            value: residencePick,
                                            onChanged: (value) {
                                              setState(() {
                                                residencePick = value;
                                              });
                                            },
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
                                            "Major": majorPick,
                                            "Gender": genderPick,
                                            "YearGroup": yearGroup.text,
                                            "CampusResidence": residencePick,
                                            "FavoriteMovie": favoriteMovie.text,
                                            "FavoriteFood": favoriteFood.text,
                                            "DOB": DOB.text

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

