import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/screens/auth_page/controller/auth_provider.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: backgroundGradient,
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 275.h,
                  margin: EdgeInsets.only(
                    left: 9.h,
                    right: 30.h,
                  ),
                  child: Text(
                    "Please enter the code we just set to (+91) *******${context.read<AuthProvider>().mobileNumberController.text.substring(7, 10)} to proceed",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 14.fSize,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 3.h,
                  right: 7.h,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    inactiveColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  controller: context.read<AuthProvider>().otpController,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 14.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child:
                      Consumer<AuthProvider>(builder: (context, provider, _) {
                    return provider.resendOtp
                        ? InkWell(
                            onTap: () {
                              provider.resendOnetimePassword();
                            },
                            child: Text(
                              'Resend Otp',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: appTheme.indigo300,
                                fontSize: 15.fSize,
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              Text(
                                "Resend OTP in : ",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: appTheme.indigo300,
                                  fontSize: 15.fSize,
                                ),
                              ),
                              Text(
                                provider.time,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: appTheme.indigo300,
                                  fontSize: 13.fSize,
                                ),
                              )
                            ],
                          );
                  }),
                ),
              ),
              SizedBox(height: 83.v),

              Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return Stack(
                    children: [
                      CustomElevatedButton(
                        onPressed: provider.isLoading
                            ? null
                            : () {
                                if (provider.isChecked) {
                                  provider.verifyOtp(context: context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Please check the terms and condtions')));
                                }
                              },
                        buttonStyle: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            backgroundColor: appTheme.indigo150),
                        text: provider.isLoading ? '' : "Submit",
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
                },
              ),
              SizedBox(height: 32.v),
              // CustomElevatedButton(
              //   text: "Resend",
              //   buttonStyle: CustomButtonStyles.fillSecondaryContainer,
              // ),
              // SizedBox(height: 44.v),
              Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return Row(
                    children: [
                      Checkbox(
                        focusColor: Colors.white,
                        value: provider.isChecked,
                        onChanged: (value) {
                          provider.isChecked = value!;
                        },
                      ),
                      Text(
                        "I agree to terms and conditions and privacy policy ",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  );
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
