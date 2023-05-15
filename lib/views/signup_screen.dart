import 'package:flutter/material.dart';
import 'package:untitled1/core/network/dio_helper.dart';
import 'package:untitled1/shared/components.dart';
import 'package:untitled1/views/second_screen.dart';

import '../core/const/resource.dart';
import '../core/network/cache_helper.dart';
import 'classes_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmcontroller = TextEditingController();
  var fnamecontroller = TextEditingController();
  var lnamecontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirm = true;
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
                            height: 35,
                          ),
                          Text(
                            'Ready To',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 32,
                              fontFamily: 'poppins',
                            ),
                          ),
                          Text(
                            'Join Us?',
                            style: TextStyle(
                              color: Color(0xff61BDEE),
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontFamily: 'poppins',
                            ),
                          ),
                          SizedBox(
                            height: 40,
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
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: defaultFormField(
                                  label: 'first name',
                                  controller: fnamecontroller,
                                  suffixPressed: () {
                                    setState(() {});
                                  },
                                  type: TextInputType.name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'this field is empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                child: defaultFormField(
                                  label: 'last name',
                                  controller: lnamecontroller,
                                  suffixPressed: () {
                                    setState(() {});
                                  },
                                  type: TextInputType.name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'this field is empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          defaultFormField(
                            label: 'phone number',
                            controller: phonecontroller,
                            suffixPressed: () {
                              setState(() {});
                            },
                            type: TextInputType.number,
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
                          SizedBox(
                            height: 22,
                          ),
                          defaultFormField(
                            obscureText: isConfirm,
                            label: 'confirm password',
                            controller: confirmcontroller,
                            type: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this field is empty';
                              }
                              return null;
                            },
                            suffix: isConfirm
                                ? Icons.visibility_off
                                : Icons.visibility,
                            isPassword: isConfirm,
                            suffixPressed: () {
                              setState(() {
                                isConfirm = !isConfirm;
                              });
                            },
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          defaultButton(
                            background: Color(0xff61BDEE),
                            function: () async {
                              if (formKey.currentState != null &&
                                  formKey.currentState!.validate()) {
                                var response = await DioHelper.post(
                                    route: '/users',
                                    data: {
                                      'email': emailcontroller.text,
                                      'password': passwordcontroller.text,
                                      "password_confirmation":
                                          confirmcontroller.text,
                                      "phone": phonecontroller.text,
                                      "first_name": fnamecontroller.text,
                                      "last_name": lnamecontroller.text,
                                    });
                                await CacheHelper.saveData(
                                    key: Cache.token,
                                    value: response['tokens']['access_token']);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => classesScreen(),
                                  ),
                                );
                              }
                            },
                            text: 'Sign Up',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login',
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
