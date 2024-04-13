import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/screens/scan_amenity/views/qr_scan_screen.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/app_decoration.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Container(
            decoration: AppDecoration.fillWhiteA700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.img4641,
                  height: 250.v,
                  width: double.maxFinite,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.h,
                    top: 10,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hi, Welcome ",
                          style: CustomTextStyles.titleLargeff010101,
                        ),
                        TextSpan(
                          text: capitalizeFirstLetter(
                            LocalStoragaeService.getUserValue(
                              UserField.userName,
                            ),
                          ),
                          style: CustomTextStyles.titleLargeff010101Bold,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.only(left: 21.h),
                  child: Text(
                    "Amenities ",
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 18),
                  ),
                ),
                SizedBox(height: 16.v),
                _buildTwentyFive(context),
                SizedBox(height: 16.v),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "How it works?",
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
                  ),
                ),
                buildInstructions(),
                buildInstructions(),
                buildInstructions(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text(
                    "Note: to use amenities, Scan QR Code",
                    style: CustomTextStyles.bodyMediumDroidSans14,
                  ),
                ),
                SizedBox(height: 11.v),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: CustomElevatedButton(
          onPressed: () {
            log(
              LocalStoragaeService.getUserValue(UserField.userName).toString(),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QrScannerWidget(),
                // builder: (context) => const SelectBlockAndApartmentScreen(),
                // builder: (context) => const SearchApartmentScreen(),
              ),
            );
          },
          buttonStyle: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              backgroundColor: appTheme.indigo150),
          text: "Check in",
          buttonTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
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

  Widget buildInstructions() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5,
      ),
      child: Row(
        children: [
          Icon(
            Icons.arrow_forward_ios,
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              'Visit our gym at anytime, check in via your phone and start work out',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}
