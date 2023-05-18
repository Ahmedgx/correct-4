import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled1/core/network/cache_helper.dart';
import 'package:untitled1/core/network/dio_helper.dart';
import 'package:untitled1/shared/components.dart';
import 'package:untitled1/views/second_screen.dart';
import 'package:untitled1/views/signup_screen.dart';

import '../core/const/resource.dart';
import 'classes_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isrememberMe = false;

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
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SecondScreen(),
                                    ),
                                  );
                                },
                                color: Color(0xff125578),
                                iconSize: 32,
                                icon: Icon(
                                  Icons.arrow_back_outlined,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
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
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Log in To Your',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 32,
                              fontFamily: 'poppins',
                            ),
                          ),
                          Text(
                            'Account',
                            style: TextStyle(
                              color: Color(0xff61BDEE),
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontFamily: 'poppins',
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          defaultFormField(
                            label: 'email address',
                            controller: emailcontroller,
                            suffix: Icons.email,
                            suffixPressed: () {
                              setState(() {});
                            },
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this field is empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          defaultFormField(
                            obscureText: isPassword,
                            label: 'password',
                            controller: passwordcontroller,
                            type: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this field is empty';
                              }
                              return null;
                            },
                            suffix: isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            isPassword: isPassword,
                            suffixPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: isrememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      isrememberMe = value!;
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    return isrememberMe
                                        ? Color(0xff586B9D)
                                        : Color(0xff586B9D);
                                  })),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff616161),
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgotten password?',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff616161),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          defaultButton(
                            background: Color(0xff61BDEE),
                            function: () async {
                              if (formKey.currentState != null &&
                                  formKey.currentState!.validate()) {
                                var response = await DioHelper.post(
                                    route: 'users/login/',
                                    data: {
                                      'email': emailcontroller.text,
                                      'password': passwordcontroller.text,
                                    });
                                log(response.toString());
                                await CacheHelper.saveData(
                                    key: Cache.token,
                                    value: response['data']['tokens']
                                        ['access_token']);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => classesScreen(),
                                  ),
                                );
                              }
                            },
                            text: 'Log in',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not a user?',
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Color(0xff61BDEE),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// <!--        android:usesCleartextTraffic="true"-->
// <!--        android:networkSecurityConfig="@xml/network_security_config"-->