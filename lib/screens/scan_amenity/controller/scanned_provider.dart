import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/scan_amenity/model/scanned_amenity_model.dart';
import 'package:nextdoorgym/screens/scan_amenity/repository/scanned_amenity_repository.dart';
import 'package:nextdoorgym/utils/utils.dart';

class ScannedAmenityProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  ScannedAmenityModel? scannedAmenity;

  Future addScanAmenity({required String amenityId}) async {
    isLoading = true;

    final apiResponse = await ScannedAmenityRepository.instance
        .scanAmenities(amenityId: amenityId);
    apiResponse.fold((l) {
      Utils.showSnackBar(l.error ?? "Something went wrong");
    }, (r) {
      scannedAmenity = r;
      Utils.showSnackBar("Amenity acquired successfully");
      isLoading = false;
    });
  }

  Future returnScanAmenity(
      {required BuildContext context, required String amenityId}) async {
    isLoading = true;
    log(amenityId.toString());
    final apiResponse =
        await ScannedAmenityRepository.instance.returnAmenity(id: amenityId);
    apiResponse.fold((l) {
      Utils.showSnackBar(l.error ?? "Something went wrong");
      isLoading = false;
    }, (r) {
      scannedAmenity = r;
      Utils.showSnackBar("Amenity returned successfully");
      getScanAmenityModel = null;
      isLoading = false;
    });
  }

  ScannedAmenityModel? getScanAmenityModel;
  Future getScanAmenity() async {
    isLoading = true;
    final apiResponse = await ScannedAmenityRepository.instance.getAmenity();
    apiResponse.fold((l) {
      Utils.showSnackBar(l.error ?? "Something went wrong");
    }, (r) {
      isLoading = false;
      getScanAmenityModel =
          r.firstWhere((element) => element.returnTime == null);
    });
  }
}
