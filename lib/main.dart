import 'package:flutter/material.dart';
import 'package:untitled1/core/const/resource.dart';
import 'package:untitled1/core/network/api_interceptors.dart';
import 'package:untitled1/core/network/cache_helper.dart';
import 'package:untitled1/core/network/dio_helper.dart';
import 'package:untitled1/views/classes_screen.dart';
import 'package:untitled1/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();
  DioHelper.dio.interceptors.add(ApiInterceptors());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CacheHelper.getData(key: Cache.token) == null
          ? SplashScreen()
          : classesScreen(),
    );
  }
}
