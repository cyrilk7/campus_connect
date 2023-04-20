import 'package:campus_connect/pages/landing_page.dart';
import 'package:campus_connect/pages/register.dart';
import 'package:campus_connect/pages/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:campus_connect/pages/sign_up.dart';

import 'package:campus_connect/pages/login.dart';

import 'feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CampusConnect',
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
        routes: {
          '/create-profile':(context) => const SignUpPage(),
          // '/edit-profile': (context) => const MyEditPage(),
        },

        );
  }
}