import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nextdoorgym/constants/api_constant.dart';
import 'package:nextdoorgym/helper/apibase_helper.dart';
import 'package:nextdoorgym/services/api_services.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';

class SetupAccountRepository {
  SetupAccountRepository._();

  static final SetupAccountRepository instance = SetupAccountRepository._();
  final ApiService _apiService = ApiService();

  Future<Either<ApiError, void>> setupAccount({
    required String username,
    required String email,
    required String gender,
  }) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.post(
          ApiConstant.setup,
          {
            "username": username,
            "email": email,
            "gender": gender,
          },
        );
        LocalStoragaeService.updateUserData(response.data['data']);
        log(response.toString());
        return response.data;
      },
    );
  }

  Future<Either<ApiError, void>> addBuilding({
    required String building,
  }) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.post(
          ApiConstant.addBuilding,
          {
            "apartment": building,
          },
        );
        log(response.toString());
        return response.data;
      },
    );
  }
}
