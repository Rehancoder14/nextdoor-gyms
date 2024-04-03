import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nextdoorgym/constants/api_constant.dart';
import 'package:nextdoorgym/helper/apibase_helper.dart';
import 'package:nextdoorgym/services/api_services.dart';

class AuthRepository {
  AuthRepository._();

  static final AuthRepository instance = AuthRepository._();
  final ApiService _apiService = ApiService();

  Future<Either<ApiError, void>> sendOtp({required String phoneNumber}) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.post(
          ApiConstant.sendOtp,
          {'phone': phoneNumber},
        );
        log(response.toString());
        return response.data;
      },
    );
  }

  Future<Either<ApiError, void>> verifyOtp(
      {required String phoneNumber, required String otp}) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.post(
          ApiConstant.verifyOtp,
          {
            'phone': phoneNumber,
            'otp': otp,
          },
        );

        return response.data;
      },
    );
  }
}
