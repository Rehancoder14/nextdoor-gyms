// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/screens/auth_page/controller/auth_provider.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/appbar_leading_image.dart';
import 'package:nextdoorgym/widgets/custom_app_bar.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          color: Colors.white,
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
                  vertical: 10.v,
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
                    SizedBox(height: 15.v),
                    CustomTextFormField(
                      textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.phone,
                      maxLen: 10,
                      autofocus: false,
                      controller:
                          context.read<AuthProvider>().mobileNumberController,
                      validator: (value) {
                        if (value!.length != 10) {
                          return 'Mobile number length should be 10';
                        }
                        return null;
                      },
                      hintText: "Enter your mobile number",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      prefix: const Icon(Icons.phone),
                    ),
                    SizedBox(height: 31.v),
                    Consumer<AuthProvider>(builder: (context, provider, _) {
                      return Stack(
                        children: [
                          CustomElevatedButton(
                            onPressed: provider.isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      provider.sendOtp(context: context);
                                    }
                                  },
                            buttonStyle: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                backgroundColor: appTheme.indigo150),
                            text: provider.isLoading ? '' : "Send OTP",
                            buttonTextStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Positioned(
                            child: provider.isLoading
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          )
                        ],
                      );
                    }),
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
      height: 130.v,
      leadingWidth: double.maxFinite,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: AppbarLeadingImage(
          imagePath: ImageConstant.imgLogo,
          margin: EdgeInsets.fromLTRB(24.h, 0.v, 292.h, 0.v),
        ),
      ),
    );
  }
}
