import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/fifth_screen.dart';
import 'package:untitled1/second_screen.dart';
import 'package:untitled1/third_screen.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: (){
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FifthScreen(),
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
                                onPressed: (){
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
                            height: 60,
                          ),
                          Image(
                            image: AssetImage('Assets/images/i2.png'),
                            height: 320,
                            width: double.infinity,
                          ),
                          Text(
                            'Save Your Time',
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
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage('Assets/images/empty.png'),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Image(
                                  image: AssetImage('Assets/images/fill.png'),
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
                                          builder: (context) => ThirdScreen(),
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
      ),
    );
  }
}