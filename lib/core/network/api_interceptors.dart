import 'package:dio/dio.dart';

import 'package:untitled1/core/network/cache_helper.dart';

import '../const/resource.dart';

class ApiInterceptors extends QueuedInterceptorsWrapper {
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZmlyc3RfbmFtZSI6Ik1vaGFtZWQiLCJsYXN0X25hbWUiOiJBYmRvIiwiZW1haWwiOiJNb2hhbWVkQGdtYWlsLmNvbSIsInBob25lIjoiMDE1NTUyNDQwMDYiLCJjcmVhdGVkX2F0IjoiMjAyMy0wNS0wM1QxNTowMzoxNS4wMDRaIiwiaWF0IjoxNjgzMTI2MjIxLCJleHAiOjQyNzUxMjYyMjF9.xovePeA1iaOeLuYMRXd3a1d8W4pkzrVC03muEyo7cfo';
    return handler.next(options);
  }
}
