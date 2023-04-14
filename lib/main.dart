import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/second_screen.dart';
import 'package:untitled1/signup_screen.dart';
import 'package:untitled1/splash_screen.dart';
import 'package:untitled1/third_screen.dart';

import 'addition_screen.dart';
import 'classes_screen.dart';
import 'fifth_screen.dart';
import 'fourth_screen.dart';
import 'last_screen.dart';
import 'login_screen.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}