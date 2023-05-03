import 'package:flutter/material.dart';
import 'package:untitled1/views/second_screen.dart';

import 'fourth_screen.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
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
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff303639),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Scan Your Paper',
                          style: TextStyle(
                            color: Color(0xff125578),
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'poppins',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'lorem ipsum random word hmmmm idk what am i writing',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff303639),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Image(
                          image: AssetImage('Assets/images/i1.png'),
                          height: 320,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('Assets/images/fill.png'),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Image(
                                image: AssetImage('Assets/images/empty.png'),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Image(
                                image: AssetImage('Assets/images/empty.png'),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FourthScreen(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    size: 24,
                                  ),
                                  backgroundColor: Color(0xff61BDEE),
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
