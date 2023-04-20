import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider extends ChangeNotifier{
  String temp_mail = "";
  String temp_firstname = "";

  String get email => temp_mail;
  String get name => temp_firstname;

  void setEmail(String email){
    temp_mail = email;
    notifyListeners();
  }

  void setFirstname(String firstname){
    temp_mail = firstname;
    notifyListeners();
  }
}