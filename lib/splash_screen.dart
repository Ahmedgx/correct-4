import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/fifth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FifthScreen(),
            ))
    );
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Correct',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    fontFamily: 'poppins',
                  ),
                ),

                SizedBox(
                  width: 5.0,
                ),

                Text(
                  '4',
                  style: TextStyle(
                    color: Color(0xff61BDEE),
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    fontFamily: 'poppins',
                  ),
                ),
              ],
            ),
        ),
      );
    }
}
