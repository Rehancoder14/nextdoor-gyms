import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/setup_account.dart/model/amenity_model.dart';
import 'package:nextdoorgym/screens/setup_account.dart/model/apartment_model.dart';
import 'package:nextdoorgym/screens/setup_account.dart/repository/setup_account_repository.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/qr_scan_apartment.dart';
import 'package:nextdoorgym/utils/utils.dart';

class SetupAccountProvider extends ChangeNotifier {
  String? _genderValue;
  String? get genderValue => _genderValue;
  set genderValue(String? value) {
    _genderValue = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<ApartmentModel> apartmentList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController buildingController = TextEditingController();

  void setupAccount({required BuildContext context}) async {
    isLoading = true;
    final apiResponse = await SetupAccountRepository.instance.setupAccount(
      username: nameController.text,
      email: emailController.text,
      gender: genderValue!,
    );

    apiResponse.fold(
      (l) {
        Utils.showSnackBar('Something went wrong');
        isLoading = false;
      },
      (r) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const QrScanApartment(),
          ),
        );
        Utils.showSnackBar('Account setup successfully');

        isLoading = false;
      },
    );
  }

  void addApartment({required BuildContext context}) async {
    isLoading = true;
    final apiResponse = await SetupAccountRepository.instance.addBuilding(
      building: apartmentModel!.internalId!,
      block: apartmentBlock!.id!,
    );

    apiResponse.fold(
      (l) {
        Utils.showSnackBar('Something went wrong');
        isLoading = false;
      },
      (r) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        Utils.showSnackBar('Apartment added successfully');

        isLoading = false;
      },
    );
  }

  AmenitiesModel? amenitiesModel;
  bool _isBottomSheetLoading = false;
  bool get isBottomSheetLoading => _isBottomSheetLoading;
  set isBottomSheetLoading(bool value) {
    _isBottomSheetLoading = value;
    notifyListeners();
  }

  Future getAmenityForUser(
      {required String id, required String buildingId}) async {
    isBottomSheetLoading = true;
    final apiResponse = await SetupAccountRepository.instance.getAmenityForUser(
      id: id,
      buildingId: buildingId,
    );
    apiResponse.fold(
      (l) {
        Utils.showSnackBar(l.error ?? 'Something went wrong');
        isBottomSheetLoading = false;
      },
      (r) {
        amenitiesModel = r;
        isBottomSheetLoading = false;
      },
    );
  }

  bool _isBuildingLoading = false;
  bool get isBuildingLoading => _isBuildingLoading;

  set isBuildingLoading(bool value) {
    _isBuildingLoading = value;
    notifyListeners();
  }

  Future getApartment() async {
    isBuildingLoading = true;
    final apiResponse = await SetupAccountRepository.instance.getBuilding();
    apiResponse.fold((l) {
      Utils.showSnackBar(l.error ?? 'Something went wrong');
    }, (r) {
      apartmentList = r;
      isBuildingLoading = false;
    });
  }

  ApartmentModel? apartmentModel;
  bool _isApartmentSelected = false;
  bool get isApartmentSelected => _isApartmentSelected;
  set isApartmentSelected(bool value) {
    _isApartmentSelected = value;
    notifyListeners();
  }

  Future getApartmentById({required String id}) async {
    isBuildingLoading = true;
    isBottomSheetLoading = true;
    final apiResponse =
        await SetupAccountRepository.instance.getApartmentByID(id: id);
    apiResponse.fold((l) {
      Utils.showSnackBar(l.error ?? 'Something went wrong');
    }, (r) {
      apartmentModel = r;
      apartmentBlockList = r.apartmentBlocks!;
      isApartmentSelected = true;
      isBuildingLoading = false;
      isBottomSheetLoading = false;
    });
  }

  List<ApartmentBlock> apartmentBlockList = [];
  ApartmentBlock? apartmentBlock;
  void selectBlock(ApartmentBlock block) {
    apartmentBlock = block;
    isBlockSelected = true;
  }

  bool _isBlockSelected = false;
  bool get isBlockSelected => _isBlockSelected;

  set isBlockSelected(bool value) {
    _isBlockSelected = value;
    notifyListeners();
  }

  String? _flat = 'A';
  String get flat => _flat!;
  set flat(String value) {
    _flat = value;
    notifyListeners();
  }
}
