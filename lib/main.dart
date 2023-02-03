import 'package:flutter/material.dart';
import 'pages/first_page.dart';
import 'pages/login_page.dart';
import 'pages/sign_up.dart';
import 'pages/verify_otp.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const First_Page(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignupPage.routeName: (context) => SignupPage(),
        VerifyOtpPage.routeName: (context) => VerifyOtpPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
