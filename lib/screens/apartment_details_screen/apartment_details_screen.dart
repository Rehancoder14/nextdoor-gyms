import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/theme/app_decoration.dart';
import 'package:nextdoorgym/theme/custom_button_style.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';

class ApartmentDetailsScreen extends StatelessWidget {
  const ApartmentDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 768.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildTwentyNine(context),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.h,
                        vertical: 41.v,
                      ),
                      decoration: AppDecoration.fillWhiteA700,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 219.h,
                            margin: EdgeInsets.only(left: 25.h),
                            child: Text(
                              "Please verify Apartment details",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles
                                  .titleLargeOnPrimaryContainer20,
                            ),
                          ),
                          SizedBox(height: 46.v),
                          Padding(
                            padding: EdgeInsets.only(left: 55.h),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgTelevision,
                                  height: 33.v,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.h,
                                    bottom: 2.v,
                                  ),
                                  child: Text(
                                    "Scan QR Code",
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 77.v),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 244.v,
                              width: 246.h,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGroup4,
                                    height: 229.v,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                      height: 232.v,
                                      width: 224.h,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.img4611,
                                            width: 224.h,
                                            alignment: Alignment.center,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 48.v),
                                              child: SizedBox(
                                                width: 166.h,
                                                child: Divider(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 42.v),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Or input manually",
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(height: 80.v),
                          CustomElevatedButton(
                            text: "Input",
                            buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                            buttonTextStyle:
                                CustomTextStyles.bodyLargeOnPrimary,
                          ),
                          SizedBox(height: 32.v),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyNine(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 35.h,
          top: 125.v,
          right: 25.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56.v,
              width: 315.h,
              decoration: BoxDecoration(
                color: appTheme.blueGray50,
                borderRadius: BorderRadius.circular(
                  15.h,
                ),
              ),
            ),
            SizedBox(height: 107.v),
            Container(
              height: 175.adaptSize,
              width: 175.adaptSize,
              margin: EdgeInsets.only(left: 65.h),
              decoration: BoxDecoration(
                color: appTheme.blueGray50,
                borderRadius: BorderRadius.circular(
                  18.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
