import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/LoginPage.dart';
import 'package:app/HomePage.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}
