import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/landing_pages/views/slider.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/qr_scan_apartment.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/setup_account_screen.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showSlider = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showSlider = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = 150.h;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.grey.shade50,
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                  horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        color: appTheme.indigo200,
                        imagePath: 'assets/images/badminton.png',
                        width: width,
                        alignment: Alignment.topRight,
                      ),
                      CustomImageView(
                        color: appTheme.indigo200,
                        width: width,
                        imagePath: 'assets/images/dumbell.png',
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        padding: EdgeInsets.only(
                          top: 15.v,
                          bottom: 10.v,
                          left: 20.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nextdoor',
                              style: theme.textTheme.headlineLarge!.copyWith(
                                  height: 1,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 24,
                        child: CustomImageView(
                          width: 65.h,
                          imagePath: 'assets/images/logo.png',
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                            width: width,
                            imagePath: 'assets/images/shoe.png',
                            color: appTheme.indigo200,
                            alignment: Alignment.topRight,
                          ),
                          CustomImageView(
                            color: appTheme.indigo200,
                            width: width,
                            imagePath: 'assets/images/shuttlecock.png',
                            alignment: Alignment.topRight,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            color: appTheme.indigo200,
                            width: 250.h,
                            imagePath: 'assets/images/barbell.png',
                            alignment: Alignment.topRight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: _showSlider
                  ? _navigateBasedOnToken() // handle auth guard
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigateBasedOnToken() {
    if (LocalStoragaeService.getUserValue(UserField.token) == null &&
        LocalStoragaeService.getUserValue(UserField.isAccountSetup) == null) {
      return const SliderScreen();
    } else if (LocalStoragaeService.getUserValue(UserField.token) != null &&
        !LocalStoragaeService.getUserValue(UserField.isAccountSetup)) {
      if (LocalStoragaeService.getUserValue(UserField.userName) != null) {
        return const QrScanApartment();
      } else {
        return SetupAccountScreen();
      }
    }
    return const HomePage();
  }
}
