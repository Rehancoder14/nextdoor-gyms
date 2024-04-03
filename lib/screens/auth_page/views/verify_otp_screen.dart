// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            height: 768.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 768.v,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle686,
                            width: 375.h,
                            alignment: Alignment.center,
                          ),
                          _buildEight(context),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgBrownYellowSun708x375,
                  width: 375.h,
                  radius: BorderRadius.circular(
                    72.h,
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.h,
          top: 78.v,
          right: 25.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 195.v,
              width: 275.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 17.h,
                        right: 121.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "WELCOME TO",
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(height: 142.v),
                          Text(
                            "Verify OTP",
                            style: theme.textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 24.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath: 'assets/images/logo.png',
                            height: 62.v,
                            radius: BorderRadius.circular(
                              4.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 2.v,
                              bottom: 5.v,
                            ),
                            child: Text(
                              "Nextdoor",
                              style: CustomTextStyles.bodyLargeOnPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.v),
            Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text(
                "I agree to terms and conditions and privacy policy ",
                style: theme.textTheme.bodySmall,
              ),
            ),
            SizedBox(height: 7.v),
            Padding(
              padding: EdgeInsets.only(
                left: 9.h,
                right: 10.h,
              ),
              child: CustomTextFormField(
                controller: passwordController,
                hintText: "*******",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                alignment: Alignment.center,
                obscureText: true,
              ),
            ),
            SizedBox(height: 8.v),
            Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text(
                "Resend OTP in : 05 sec ",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 52.v),
            Padding(
              padding: EdgeInsets.only(left: 13.h),
              child: Row(
                children: [
                  CustomElevatedButton(
                    width: 154.h,
                    text: "verify OTP",
                    margin: EdgeInsets.only(top: 1.v),
                  ),
                  CustomElevatedButton(
                    width: 154.h,
                    text: "Resend",
                    margin: EdgeInsets.only(left: 13.h),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
