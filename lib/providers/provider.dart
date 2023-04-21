import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
class MyProvider extends ChangeNotifier{
  String temp_mail = "";
  String temp_firstname = "";
  String temp_major = "";
  String temp_lastname = "";
  String temp_residence = "";
  String temp_movie = "";
  String temp_food = "";
  String temp_DOB = "";
  String temp_ID = "";
  String temp_year = "";
  String temp_gender = "";


  String get email => temp_mail;
  String get firstname => temp_firstname;
  String get lastname => temp_lastname;
  String get major => temp_major;
  String get yearGroup => temp_year;
  String get favoriteMovie => temp_movie;
  String get favoriteFood => temp_food;
  String get campusResidence => temp_residence;
  String get DOB => temp_DOB;
  String get ID => temp_ID;
  String get gender => temp_gender;

  void setYearGroup(String yearGroup){
    temp_year = yearGroup;
    notifyListeners();
  }

  void setMovie(String favoriteMovie){
    temp_movie = favoriteMovie;
    notifyListeners();
  }

  void setFood(String favoriteFood){
    temp_food = favoriteFood;
    notifyListeners();
  }

  void setResidence(String campusResidence){
    temp_residence = campusResidence;
    notifyListeners();
  }

  void setDOB(String DOB){
    temp_DOB = DOB;
    notifyListeners();
  }

  void setID(String ID){
    temp_mail = ID;
    notifyListeners();
  }

  void setGender(String gender){
    temp_gender = gender;
    notifyListeners();
  }

  void setEmail(String email){
    temp_mail = email;
    notifyListeners();
  }

  void setFirstname(String firstname){
    temp_firstname = firstname;
    notifyListeners();
  }

  void setLastname(String lastname){
    temp_lastname = lastname;
    notifyListeners();
  }

  void setMajor(String major){
    temp_major = major;
    notifyListeners();
  }
}