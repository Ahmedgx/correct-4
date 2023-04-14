import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/login_screen.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/signup_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          Container(
                            width: double.infinity,
                            height: 48,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 200,
                                ),
                                Text(
                                  'Welcome To',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.waving_hand_outlined ,
                                  color: Color(0xff85B6FF),
                                  size: 33.92,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Correct',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          const Image(
                              image:AssetImage('Assets/images/i4.png'),
                            height: 280,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          defaultButton(
                            background: Color(0xff61BDEE),
                            function: ()
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                ),
                              );
                              {}
                            },
                            text: 'Log in',
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          defaultButton(
                            background: Colors.white,
                            function: ()
                            {
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              }
                            },
                          text:'Sign Up',
                              color: Color(0xff61BDEE),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}