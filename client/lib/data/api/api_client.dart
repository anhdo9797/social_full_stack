import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:social/constant/api.dart';
import 'package:social/data/local/storage.dart';

part 'api_client.g.dart';

@riverpod
Dio apiClient(Ref ref) {
  Dio dio = Dio();
  dio.options.baseUrl = BASE_URL;
  dio.options.connectTimeout = const Duration(seconds: 15);
  dio.options.receiveTimeout = const Duration(seconds: 15);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      if (Storage.token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer ${Storage.token}';
      }

      return handler.next(options);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
  ));

  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  return dio;
}
