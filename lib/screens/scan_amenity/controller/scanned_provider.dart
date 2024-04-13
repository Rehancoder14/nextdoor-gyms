import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
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

  Future returnScanApartment(
      {required BuildContext context, required String amenityId}) async {
    isLoading = true;

    final apiResponse =
        await ScannedAmenityRepository.instance.returnAmenity(id: amenityId);
    apiResponse.fold((l) {
      Utils.showSnackBar(l.error ?? "Something went wrong");
    }, (r) {
      scannedAmenity = r;
      Utils.showSnackBar("Amenity returned successfully");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (Route<dynamic> route) =>
            false, // This makes sure that all previous screens are removed
      );
      isLoading = false;
    });
  }
}
