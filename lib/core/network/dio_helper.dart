import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:untitled1/core/const/resource.dart';

class DioHelper {
  static bool isUnAuth = true;
  static Dio dio = Dio();

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:3000/',
      validateStatus: (status) {
        return !(status.toString() == '401');
      },
      receiveDataWhenStatusError: true,
      followRedirects: true,
    );

    dio = Dio(options);
  }

  static Future get({
    required String route,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? userInfo,
  }) async {
    late Response response;

    response = await dio.get(
      route,
      queryParameters: parameters,
    );
    return response.data;
  }

  static Future post({
    required String route,
    Map<String, dynamic>? parameters,
    dynamic data,
    dynamic headers,
  }) async {
    late Response response;

    response = await dio.post(
      route,
      queryParameters: parameters,
      data: data,
    );
    log(response.data.toString());
    return response.data;
  }

  static Future put(
      {required String route,
      Map<String, dynamic>? parameters,
      dynamic data}) async {
    Response response = await dio.put(
      route,
      queryParameters: parameters,
      data: data,
    );
    return response.data;
  }

  static Future delete(
      {required String route,
      Map<String, dynamic>? parameters,
      dynamic data}) async {
    Response response = await dio.delete(
      route,
      queryParameters: parameters,
      data: data,
    );

    return response.data;
  }
}
