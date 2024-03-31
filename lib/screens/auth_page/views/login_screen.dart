// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/screens/auth_page/views/verify_otp_screen.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 840.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 580.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgBrownYellowSun,
                        width: 375.h,
                        radius: BorderRadius.only(
                          topRight: Radius.circular(72.h),
                          topLeft: Radius.circular(72.h),
                        ),
                        alignment: Alignment.center,
                      ),
                      _buildSeven(context),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 103.v,
                  width: 110.h,
                  margin: EdgeInsets.only(
                    left: 125.h,
                    top: 85.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      55.h,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.img101,
                width: 192.h,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 84.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.h,
          top: 79.v,
          right: 14.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Text(
                "WELCOME TO",
                style: theme.textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 66.v,
              width: 264.h,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 6.v),
                      child: Text(
                        "Nextdoor",
                        style: theme.textTheme.displayMedium!
                            .copyWith(fontSize: 42),
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgLogo,
                    height: 66.v,
                    radius: BorderRadius.circular(
                      4.h,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                "Login with mobile Number",
                style: theme.textTheme.headlineSmall!.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.only(
                left: 7.h,
                right: 14.h,
              ),
              child: CustomTextFormField(
                fillColor: appTheme.indigo100,
                controller: mobileNumberController,
                hintText: "Enter mobile number",
                textInputAction: TextInputAction.done,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 63.v),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyOtpScreen(),
                  ),
                );
              },
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              ),
              width: 180.h,
              text: "Verify OTP",
              buttonTextStyle: const TextStyle(
                color: Colors.white,
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
