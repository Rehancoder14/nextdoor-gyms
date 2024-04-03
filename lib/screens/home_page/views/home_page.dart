import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/setup_account_screen.dart';
import 'package:nextdoorgym/theme/app_decoration.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_app_bar.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                left: 11.h,
                right: 11.h,
                bottom: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img4641,
                    height: 286.v,
                    radius: BorderRadius.circular(
                      51.h,
                    ),
                  ),
                  SizedBox(height: 41.v),
                  Padding(
                    padding: EdgeInsets.only(left: 21.h),
                    child: Text(
                      "Amenities ",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 16.v),
                  _buildTwentyFive(context),
                  SizedBox(height: 93.v),
                  Padding(
                    padding: EdgeInsets.only(left: 18.h),
                    child: Text(
                      "Note: to use amenities, Scan QR Code",
                      style: CustomTextStyles.bodyMediumDroidSans14,
                    ),
                  ),
                  SizedBox(height: 11.v),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SetupAccountScreen()));
                    },
                    text: "Check in",
                    margin: EdgeInsets.symmetric(horizontal: 19.h),
                    alignment: Alignment.center,
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 25.h),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hi, Welcome ",
                style: CustomTextStyles.titleLargeff010101,
              ),
              TextSpan(
                text: "John",
                style: CustomTextStyles.titleLargeff010101Bold,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyFive(BuildContext context) {
    return Container(
      height: 82.v,
      width: 333.h,
      margin: EdgeInsets.only(left: 3.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img451,
            height: 82.v,
            alignment: Alignment.centerLeft,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                top: 1.v,
                bottom: 1.v,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    color: appTheme.gray100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder24,
                    ),
                    child: Container(
                      height: 100.adaptSize,
                      width: 80.adaptSize,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder24,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.img451,
                            width: 56.h,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 10.v),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Swim",
                              style: CustomTextStyles.bodyMediumDroidSans,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 53,
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    color: appTheme.gray100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder24,
                    ),
                    child: Container(
                      height: 100.adaptSize,
                      width: 80.adaptSize,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder24,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.img4671,
                            width: 56.h,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 2.v),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "yoga",
                              style: CustomTextStyles.bodyMediumDroidSans,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 46,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder24,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.img4661,
                          height: 46.v,
                        ),
                        SizedBox(height: 3.v),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text(
                            "Gym",
                            style: CustomTextStyles.bodyMediumDroidSans,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
