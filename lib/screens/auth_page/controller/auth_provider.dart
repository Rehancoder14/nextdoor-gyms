import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/auth_page/repository/auth_repository.dart';
import 'package:nextdoorgym/screens/verify_otp_screen/verify_otp_screen.dart';
import 'package:nextdoorgym/utils/utils.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  bool _resendOtp = false;
  bool get resendOtp => _resendOtp;
  Timer? timer;

  bool _isOtpSent = false;
  bool get isOtpSent => _isOtpSent;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set isOtpSent(bool value) {
    _isOtpSent = value;
    notifyListeners();
  }

  set resendOtp(bool value) {
    _resendOtp = value;
    notifyListeners();
  }

  String _time = '1:00';
  String get time => _time;

  set time(String value) {
    _time = value;
    notifyListeners();
  }

  void sendOtp({required BuildContext context}) async {
    isLoading = true;
    final apiResponse = await AuthRepository.instance.sendOtp(
      phoneNumber: mobileNumberController.text,
    );

    apiResponse.fold(
      (l) {
        log(l.toString());
        Utils.showSnackBar('Failed to send the otp');
      },
      (r) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const VerifyOtpScreen(),
          ),
        );
        isOtpSent = true;
        showTimeFor60Seconds();
        isLoading = false;
        // Utils.showSnackBar('Otp sent successfully');
      },
    );
  }

  void verifyOtp({
    required BuildContext context,
  }) async {
    final apiResponse = await AuthRepository.instance.sendOtp(
      phoneNumber: mobileNumberController.text,
    );

    apiResponse.fold(
      (l) => Utils.showSnackBar(l.error ?? 'Failed to verify the otp'),
      (r) {
        Utils.showSnackBar('Otp verified successfully');
        otpController.clear();
      },
    );
  }

  showTimeFor60Seconds() {
    Duration duration = const Duration(seconds: 60);
    int remainingSeconds = duration.inSeconds;

    // Create a timer that triggers every second
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        _resendOtp = true;
        notifyListeners();
      } else {
        // Format the remaining seconds into minutes:seconds
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;

        timeData(minutes, seconds);

        remainingSeconds = remainingSeconds - 1;
      }
    });
  }

  timeData(int minutes, int seconds) {
    time = '$minutes:${seconds.toString().padLeft(2, '0')}';
    notifyListeners();
  }

  void resendOnetimePassword() async {
    final apiResponse = await AuthRepository.instance.sendOtp(
      phoneNumber: mobileNumberController.text,
    );
    apiResponse.fold((l) {
      Utils.showSnackBar('Failed to send the otp');
    }, (r) {
      resendOtp = true;
      showTimeFor60Seconds();
      Utils.showSnackBar('Otp sent successfully');
    });
  }
}
