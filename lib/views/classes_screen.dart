import 'package:flutter/material.dart';

import '../core/network/dio_helper.dart';
import 'addition_screen.dart';

class classesScreen extends StatefulWidget {
  const classesScreen({Key? key}) : super(key: key);

  @override
  State<classesScreen> createState() => _classesScreenState();
}

class _classesScreenState extends State<classesScreen> {
  var formKey = GlobalKey<FormState>();

  Future<Classes> getData() async {
    var response = await DioHelper.post(route: '/users/classes', data: {});
    Classes classes = Classes.fromJson(response);
    return classes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot<Classes> snapshot) => Scaffold(
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
                      myClass: snapshot.data!.classGroup![index],
                    ),
                    itemCount: snapshot.data?.classGroup?.length ?? 0,
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
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({required this.myClass, Key? key}) : super(key: key);

  final ClassGroup myClass;

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
                    builder: (context) => AdditionScreen(),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Spacer(),
                            Text(
                              'Simu',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
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
                            onPressed: () {},
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
  int? id;
  int? userId;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<ClassGroup>? classGroup;

  Classes(
      {this.id,
      this.userId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.classGroup});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
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
    data['user_id'] = this.userId;
    data['name'] = this.name;
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
  int? userId;
  int? classId;
  String? name;
  String? modelAnwser;
  String? createdAt;
  String? updatedAt;

  ClassGroup(
      {this.id,
      this.userId,
      this.classId,
      this.name,
      this.modelAnwser,
      this.createdAt,
      this.updatedAt});

  ClassGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    classId = json['class_id'];
    name = json['name'];
    modelAnwser = json['model_anwser'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['class_id'] = this.classId;
    data['name'] = this.name;
    data['model_anwser'] = this.modelAnwser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
