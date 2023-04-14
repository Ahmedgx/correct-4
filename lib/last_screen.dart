import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({Key? key}) : super(key: key);

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {

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
                  padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),

                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){},
                                  color: const Color(0xff000000),
                                  iconSize: 32,
                                  icon: const Icon(
                                    Icons.menu_rounded,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Correct',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26,
                                    fontFamily: 'poppins',
                                  ),
                                ),

                                const SizedBox(
                                  width: 5.0,
                                ),

                                const Text(
                                  '4',
                                  style: TextStyle(
                                    color: Color(0xff61BDEE),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26,
                                    fontFamily: 'poppins',
                                  ),
                                ),

                                const Spacer(),

                                IconButton(
                                  onPressed: (){},
                                  iconSize: 45,
                                  icon: const CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Color(0xff4E4E4E),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 35,
                            ),

                          ],
                        )
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
