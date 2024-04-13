import 'package:dartz/dartz.dart';
import 'package:nextdoorgym/constants/api_constant.dart';
import 'package:nextdoorgym/helper/apibase_helper.dart';
import 'package:nextdoorgym/screens/scan_amenity/model/scanned_amenity_model.dart';
import 'package:nextdoorgym/services/api_services.dart';

class ScannedAmenityRepository {
  ScannedAmenityRepository._();

  static final ScannedAmenityRepository instance = ScannedAmenityRepository._();
  final ApiService _apiService = ApiService();

  Future<Either<ApiError, ScannedAmenityModel>> scanAmenities(
      {required String amenityId}) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.post(ApiConstant.scanAmenity, {
          "amenityId": amenityId,
        });

        return ScannedAmenityModel.fromJson(
          response.data['data'],
        );
      },
    );
  }

  Future<Either<ApiError, ScannedAmenityModel>> returnAmenity(
      {required String id}) async {
    return ApiCallWithErrorHandler.call(
      () async {
        final response = await _apiService.post(ApiConstant.returnAmenity, {
          "id": id,
        });

        return ScannedAmenityModel.fromJson(
          response.data['data'],
        );
      },
    );
  }
}
