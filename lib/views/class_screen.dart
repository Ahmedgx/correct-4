import 'package:flutter/material.dart';
import 'package:untitled1/shared/components.dart';
import 'package:untitled1/views/actions_screen.dart';

import 'classes_screen.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key, required this.myClass}) : super(key: key);

  final Data myClass;

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
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
                        onPressed: () {},
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
                  Text(
                    widget.myClass.name!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.myClass.classGroup!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GroupCard(
                            MyGroup: widget.myClass.classGroup![index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.MyGroup,
  });

  final ClassGroup MyGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        defaultButton(
          height: 73,
          background: Color(0xff61BDEE),
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActionsScreen(
                  myGroup: MyGroup,
                ),
              ),
            );
          },
          text: MyGroup.name!,
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
