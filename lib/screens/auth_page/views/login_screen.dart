// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/screens/auth_page/controller/auth_provider.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/appbar_leading_image.dart';
import 'package:nextdoorgym/widgets/custom_app_bar.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 25.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.img101,
                      width: 240.h,
                      margin: EdgeInsets.only(left: 24.h),
                    ),
                    SizedBox(height: 21.v),
                    Text(
                      "Login with mobile Number",
                      style: CustomTextStyles.titleLarge20,
                    ),
                    SizedBox(height: 8.v),
                    // CustomPhoneNumber(
                    //   country: selectedCountry,
                    //   controller: phoneNumberController,

                    // ),
                    SizedBox(height: 31.v),
                    CustomElevatedButton(
                      onPressed: () {
                        if (context
                                .read<AuthProvider>()
                                .otpController
                                .text
                                .length ==
                            6) {
                          context.read<AuthProvider>().sendOtp(
                                context: context,
                              );
                        }
                      },
                      text: "verify OTP",
                      buttonTextStyle: CustomTextStyles.titleMediumBlack900,
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLogo,
        margin: EdgeInsets.fromLTRB(24.h, 5.v, 292.h, 5.v),
      ),
    );
  }
}
