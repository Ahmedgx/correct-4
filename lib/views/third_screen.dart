import 'package:flutter/material.dart';
import 'package:untitled1/views/second_screen.dart';

import 'fourth_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
                            IconButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FourthScreen(),
                                  ),
                                );
                              },
                              color: Color(0xff125578),
                              iconSize: 32,
                              icon: Icon(
                                Icons.arrow_back_outlined,
                              ),
                            ),
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
                          height: 45,
                        ),
                        Image(
                          image: AssetImage('Assets/images/i3.png'),
                          height: 320,
                          width: double.infinity,
                        ),
                        Text(
                          'And Get Best',
                          style: TextStyle(
                            color: Color(0xff125578),
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'poppins',
                          ),
                        ),
                        Text(
                          'Accuracy',
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
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('Assets/images/empty.png'),
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
                                image: AssetImage('Assets/images/fill.png'),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SecondScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'start',
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'poppins',
                                    ),
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
