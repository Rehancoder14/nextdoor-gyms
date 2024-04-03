import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/theme/app_decoration.dart';
import 'package:nextdoorgym/theme/custom_button_style.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';

class SuccessfulScanScreen extends StatelessWidget {
  SuccessfulScanScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController editTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 23.h,
            vertical: 18.v,
          ),
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
                  controller: editTextController,
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
              _buildGender(context),
              SizedBox(height: 52.v),
              CustomElevatedButton(
                text: "Submit",
                margin: EdgeInsets.symmetric(horizontal: 7.h),
                buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGender(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                bottom: 6.v,
              ),
              child: _buildGender(
                context,
                // female: "Male",
              ),
            ),
          ),
          Spacer(
            flex: 53,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 6.v),
              child: _buildGender(
                context,
              ),
            ),
          ),
          Spacer(
            flex: 46,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.v,
                  width: 60.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 50.adaptSize,
                          width: 50.adaptSize,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onError,
                            borderRadius: BorderRadius.circular(
                              25.h,
                            ),
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.img461,
                        height: 52.v,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "Others",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
