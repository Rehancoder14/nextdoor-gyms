import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nextdoorgym/constants/api_constant.dart';
import 'package:nextdoorgym/helper/apibase_helper.dart';
import 'package:nextdoorgym/screens/auth_page/model/user_model.dart';
import 'package:nextdoorgym/services/api_services.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';

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

  Future<Either<ApiError, UserModel>> verifyOtp(
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
        log(response.data.toString());

        LocalStoragaeService.updateUserData(response.data['data']);
        log(response.data['data']['building'].toString());
        if (response.data['data']['building'] != null) {
          LocalStoragaeService.updateUserData(
            response.data['data']['building'],
          );
        }
        return UserModel.fromJson(response.data['data']);
      },
    );
  }
}
