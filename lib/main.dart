import 'package:flutter/material.dart';
import 'package:untitled1/core/network/cache_helper.dart';
import 'package:untitled1/core/network/dio_helper.dart';
import 'package:untitled1/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
