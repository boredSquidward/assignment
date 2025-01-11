import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static String baseApi = 'https://sg-api.mylorry.ai/api/';

  final _dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
      // sendTimeout: const Duration(seconds: 15),
      baseUrl: baseApi,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      }));

  setupDioInterceptors() {
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: (log) => debugPrint(log as String?),
    ));
  }

  Dio get dio => _dio;
}
