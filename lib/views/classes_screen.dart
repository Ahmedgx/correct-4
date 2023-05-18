import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../core/network/dio_helper.dart';
import 'class_screen.dart';

class classesScreen extends StatefulWidget {
  const classesScreen({Key? key}) : super(key: key);

  @override
  State<classesScreen> createState() => _classesScreenState();
}

class _classesScreenState extends State<classesScreen> {
  var formKey = GlobalKey<FormState>();

  Future<Classes> getData() async {
    var response = await DioHelper.get(
      route: 'users/classes',
    );
    Classes classes = Classes.fromJson(response);
    return classes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot<Classes> snapshot) =>
          (snapshot.connectionState == ConnectionState.done)
              ? Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      //  TODO: Add New Card
                    },
                    backgroundColor: const Color(0xffffffff),
                    child: const Image(
                      image: AssetImage('Assets/images/add.png'),
                    ),
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
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
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'your',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'classes',
                                    style: TextStyle(
                                        color: Color(0xff61BDEE),
                                        fontSize: 28,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Poppins-Bold'),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.search_rounded,
                                        size: 30,
                                        color: Color(0xff61BDEE),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20),
                              itemBuilder: (context, index) => MainCard(
                                myClass: snapshot.data!.data![index],
                              ),
                              itemCount: snapshot.data!.data!.length,
                              scrollDirection: Axis.vertical,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: const [Colors.blue],
                  strokeWidth: 2,
                  backgroundColor: Colors.white,
                ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({required this.myClass, Key? key}) : super(key: key);

  final ClassModel myClass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xff61BDEE),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassScreen(
                      myClass: myClass,
                    ),
                  ),
                );
              },
              child: Container(
                height: 82,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: const Color(0xff61BDEE),
                  border: Border.all(
                    width: 0,
                    color: const Color(0xff61BDEE),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        myClass.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Excel Sheet',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Color(0xff424242),
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.ios_share,
                              color: Color(0xff61BDEE),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                            },
                            child: const Text(
                              'Add Model Answer',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Color(0xff424242),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Add Buble Sheet',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Color(0xff424242),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Classes {
  List<ClassModel>? data;

  Classes({this.data});

  Classes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClassModel>[];
      json['data'].forEach((v) {
        data!.add(new ClassModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassModel {
  int? id;
  String? name;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<ClassGroup>? classGroup;

  ClassModel(
      {this.id,
      this.name,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.classGroup});

  ClassModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ClassGroup'] != null) {
      classGroup = <ClassGroup>[];
      json['ClassGroup'].forEach((v) {
        classGroup!.add(new ClassGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.classGroup != null) {
      data['ClassGroup'] = this.classGroup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassGroup {
  int? id;
  int? classId;
  int? userId;
  String? name;
  String? modelName;
  Null? modelAnswer;
  String? createdAt;
  String? updatedAt;

  ClassGroup(
      {this.id,
      this.classId,
      this.userId,
      this.name,
      this.modelName,
      this.modelAnswer,
      this.createdAt,
      this.updatedAt});

  ClassGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classId = json['class_id'];
    userId = json['user_id'];
    name = json['name'];
    modelName = json['model_name'];
    modelAnswer = json['model_answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['class_id'] = this.classId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['model_name'] = this.modelName;
    data['model_answer'] = this.modelAnswer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
