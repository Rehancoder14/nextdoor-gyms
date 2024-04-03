import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/auth_page/controller/auth_provider.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
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
                    style: CustomTextStyles.bodyMediumDroidSansOnPrimary,
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
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    inactiveColor: appTheme.indigo150,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  controller: context.read<AuthProvider>().otpController,
                  onCompleted: (v) {
                    print("Completed");
                  },
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
                                style: CustomTextStyles
                                    .bodyMediumDroidSansPrimaryContainer,
                              ),
                              Text(
                                provider.time,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: appTheme.indigo150,
                                  fontSize: 15.fSize,
                                ),
                              )
                            ],
                          );
                  }),
                ),
              ),
              SizedBox(height: 83.v),
              CustomElevatedButton(
                onPressed: () {
                  context.read<AuthProvider>().verifyOtp(context: context);
                },
                buttonStyle: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    backgroundColor: appTheme.indigo150),
                text: "Verify OTP",
                buttonTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 32.v),
              // CustomElevatedButton(
              //   text: "Resend",
              //   buttonStyle: CustomButtonStyles.fillSecondaryContainer,
              // ),
              // SizedBox(height: 44.v),
              Text(
                "I agree to terms and conditions and privacy policy ",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
