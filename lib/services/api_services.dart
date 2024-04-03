import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/api_constant.dart';

class ApiService extends ChangeNotifier {
  final Dio _dio = Dio();
  final String _baseUrl = ApiConstant.baseUrl;

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Request: ${options.method} ${options.path}', name: 'apicheck');
          log('${options.baseUrl}${options.path}', name: 'apicheck');
          if (options.method != 'GET') {
            log(' - With -');
            log('${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('Response: ${response.statusCode} ${response.statusMessage}');
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? customBaseURL,
    CancelToken? cancelToken,
  }) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.get(
      customBaseURL ?? false ? '' : path,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<Response> post(
    String path,
    dynamic data, {
    bool? isCustomBaseURL,
    String contentType = 'application/json',
  }) async {
    _dio.options.baseUrl = isCustomBaseURL ?? false ? path : _baseUrl;
    return await _dio.post(
      isCustomBaseURL ?? false ? '' : path,
      data: data,
      options: Options(contentType: contentType),
    );
  }

  Future<Response> put(String path, dynamic data,
      {bool? customBaseURL, String contentType = 'application/json'}) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.put(
      customBaseURL ?? false ? '' : path,
      data: data,
      options: Options(contentType: contentType),
    );
  }

  Future<Response> patch(
    String path,
    int id,
    dynamic data, {
    bool? customBaseURL,
  }) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.patch(
      customBaseURL ?? false ? '' : '$path$id',
      data: data,
    );
  }

  Future<Response> delete(String path, String id, {bool? customBaseURL}) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;
    return await _dio.delete(
      customBaseURL ?? false ? '' : '$path$id',
    );
  }
}
