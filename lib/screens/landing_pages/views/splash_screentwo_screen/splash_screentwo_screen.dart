import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/theme/custom_image_view.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';

class SplashScreentwoScreen extends StatelessWidget {
  const SplashScreentwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 30.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 343.h,
                        child: Text(
                          "Easy and Seamless Access to society amenities",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineLarge!
                              .copyWith(height: 1, fontSize: 22),
                        ),
                      ),
                      SizedBox(height: 56.v),
                      // CustomImageView(
                      //   imagePath: ImageConstant.imgGroup427Indigo100,
                      //   height: 6.v,
                      //   margin: EdgeInsets.only(left: 107.h),
                      // ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.h,
                    vertical: 115.v,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgGroup2,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 272.v,
                          width: 223.h,
                          margin: EdgeInsets.only(right: 29.h),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgRectangle684Gray800,
                                height: 48.v,
                                alignment: Alignment.bottomCenter,
                              ),
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgRectangle684Gray800239x62,
                                width: 62.h,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 38.h),
                              ),
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgRectangle684Gray800223x51,
                                width: 51.h,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 46.h),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 45.v),
                      _buildEight(context),
                      SizedBox(height: 15.v),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.img22,
                width: 359.h,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 85.v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgTelevision,
            height: 27.v,
            margin: EdgeInsets.only(top: 1.v),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgTelevision,
            height: 27.v,
          ),
        ],
      ),
    );
  }
}
