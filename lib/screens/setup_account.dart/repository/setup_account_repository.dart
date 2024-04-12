import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nextdoorgym/constants/api_constant.dart';
import 'package:nextdoorgym/helper/apibase_helper.dart';
import 'package:nextdoorgym/screens/setup_account.dart/model/amenity_model.dart';
import 'package:nextdoorgym/screens/setup_account.dart/model/apartment_model.dart';
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
    required String block,
  }) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.post(
          ApiConstant.addBuilding,
          {"buildingId": building, "blockId": block},
        );
        LocalStoragaeService.updateUserData(response.data['data']['building']);
        log(response.toString());
        return response.data;
      },
    );
  }

  Future<Either<ApiError, List<ApartmentModel>>> getBuilding() async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.get(
          ApiConstant.apartment,
        );
        log(response.data.toString());
        return ApartmentModel.helper.fromMapArray(
          response.data['data'],
        );
      },
    );
  }

  Future<Either<ApiError, AmenitiesModel>> getAmenityForUser(
      {required String id, required String buildingId}) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.get(
          ApiConstant.amenityForUser,
          queryParameters: {
            'id': id,
            'buildingId': buildingId,
          },
        );
        log(response.data['data'].toString());
        return AmenitiesModel.fromJson(
          response.data['data'],
        );
      },
    );
  }
}
