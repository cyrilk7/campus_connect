import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../pages/login.dart';
import '../providers/provider.dart';

Future<void> SignUp(BuildContext context, data) async {
  var url = Uri.http("127.0.0.1:5000", "/profile");
  var request = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );

  print(request.statusCode);
  if (request.statusCode == 201) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
  else{
    var title = "Error";
    var message = "Sign up was unsuccessful";
    dialogBox(context, title, message);
  }
}

void dialogBox(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Exit'))
          ],
        );
      });
}


Future<void> login(BuildContext context, data) async{
  var url = Uri.http("127.0.0.1:5000", "/login");
  var request = await http.post(
      url,
    headers: {'Content-type': 'application/json'},
    body: jsonDecode(data),
  );

  var responseBody = jsonDecode(request.body);
  if (!responseBody["Success"]){
    dialogBox(context, "Error", "Incorrect email or password");
  }
  if (responseBody["Success"]){
    Provider.of<MyProvider>(context, listen: false).temp_mail = responseBody["email"];
    Provider.of<MyProvider>(context, listen: false).temp_firstname = responseBody["email"];
  }
  else{
    dialogBox(context, "Error", "Incrrect email or password");
  }
}