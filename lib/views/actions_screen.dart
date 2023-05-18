import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:untitled1/core/network/dio_helper.dart';
import 'package:untitled1/core/services/image_picker_service.dart';

import 'classes_screen.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({required this.myClass, Key? key}) : super(key: key);

  final ClassModel myClass;

  @override
  State<ActionsScreen> createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 32,
              ),
              Text(
                widget.myClass.name!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  //  TODO:
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Excel Sheet',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 240,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'Options',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextButton(
                                      child: Container(
                                        height: 55,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Camera',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                      onPressed: () async {
                                        File file = await ImagePickerService
                                            .pickImageFromCamera();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Container(
                                        height: 55,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent
                                                .withOpacity(.2),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Gallery',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                      onPressed: () async {
                                        File file = await ImagePickerService
                                            .pickImageFromGallery();
                                        Navigator.pop(context);
                                        FormData formData = FormData.fromMap({
                                          'model': await MultipartFile.fromFile(
                                            file.path,
                                            contentType:
                                                MediaType('image', 'jpg'),
                                          ),
                                        });
                                        var respone = await DioHelper.dio.post(
                                          'groups/${widget.myClass.id}/setModelAnswer',
                                          data: formData,
                                          options: Options(
                                            contentType: 'multipart/form-data',
                                          ),
                                        );
                                        log(respone.data.toString());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Add Model Answer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await ImagePickerService.pickImageFromGallery();
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Add MCQ Paper',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            //  TODO:
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
