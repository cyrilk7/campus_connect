import 'package:campus_connect/pages/landing_page.dart';
import 'package:campus_connect/pages/register.dart';
import 'package:campus_connect/pages/view.dart';
import 'package:campus_connect/pages/view_profile.dart';
import 'package:campus_connect/providers/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:campus_connect/pages/sign_up.dart';

import 'package:campus_connect/pages/login.dart';
import 'package:provider/provider.dart';

import 'pages/feed.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
        apiKey: "AIzaSyBBgaqd78BfzpnPSspGew10rGGYOJLAPpQ",
        authDomain: "social-media-web-app-a55a3.firebaseapp.com",
        projectId: "social-media-web-app-a55a3",
        storageBucket: "social-media-web-app-a55a3.appspot.com",
        messagingSenderId: "882873716485",
        appId: "1:882873716485:web:165efeb8cc2857d296716c",
        measurementId: "G-WQ7F2S313C"
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (_) => MyProvider(),
      child: MaterialApp(
        title: 'CampusConnect',
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
        routes: {
          '/create-profile': (context) => const LoginPage(),
          // '/edit-profile': (context) => const MyEditPage(),
        },
      ),
    );
    MaterialApp(
      title: 'CampusConnect',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes: {
        '/create-profile': (context) => const SignUpPage(),
        // '/edit-profile': (context) => const MyEditPage(),
      },
    );
  }
}
