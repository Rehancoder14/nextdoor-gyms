import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/constants/validators.dart';
import 'package:nextdoorgym/screens/apartment_details_screen/apartment_details_screen.dart';
import 'package:nextdoorgym/screens/setup_account.dart/components/gender_drop_down.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/theme/custom_button_style.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class SetupAccountScreen extends StatelessWidget {
  const SetupAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 23.h,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img4631,
                    height: 277.v,
                  ),
                  SizedBox(height: 29.v),
                  Padding(
                    padding: EdgeInsets.only(left: 19.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Hi, Please ente",
                            style: CustomTextStyles.titleLargeff00000020,
                          ),
                          TextSpan(
                            text: "r",
                            style: CustomTextStyles.titleLargeff000000,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 18.v),
                  Padding(
                    padding: EdgeInsets.only(left: 18.h),
                    child: Text(
                      "Name",
                      style: CustomTextStyles.bodyMediumDroidSansOnPrimary,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.h),
                    child: CustomTextFormField(
                      hintText: 'Enter your name',
                      validator: nameValidator,
                      textStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      controller:
                          context.read<SetupAccountProvider>().nameController,
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "Email",
                      style: CustomTextStyles.bodyMediumDroidSansOnPrimary,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.h),
                    child: CustomTextFormField(
                      hintText: 'Enter your email',
                      validator: emailValidator,
                      textStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400),
                      controller:
                          context.read<SetupAccountProvider>().emailController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "Gender",
                      style: CustomTextStyles.bodyMediumDroidSansOnPrimary,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Padding(
                    padding: EdgeInsets.all(7.h),
                    child: const GenderDropDown(),
                  ),
                  SizedBox(height: 52.v),
                  Consumer<SetupAccountProvider>(
                    builder: (context, provider, _) {
                      return Stack(
                        children: [
                          CustomElevatedButton(
                            onPressed: () async {
                              // if (_formKey.currentState!.validate()) {
                              //   provider.setupAccount(context: context);
                              // }
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ApartmentDetailsScreen(),
                                ),
                              );
                            },
                            text: provider.isLoading ? '' : "Submit",
                            margin: EdgeInsets.symmetric(horizontal: 7.h),
                            buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                            buttonTextStyle:
                                CustomTextStyles.bodyLargeOnPrimary,
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
                  SizedBox(
                    height: 5.v,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
