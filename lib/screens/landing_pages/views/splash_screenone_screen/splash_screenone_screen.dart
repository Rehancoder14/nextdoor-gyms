import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/utils/size.dart';

class SplashScreenoneScreen extends StatelessWidget {
  const SplashScreenoneScreen({Key? key})
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
                  margin: EdgeInsets.only(right: 1.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 10.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 294.h,
                        child: Text(
                          "Elevated Wellness services within society",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineLarge!
                              .copyWith(height: 1, fontSize: 22),
                        ),
                      ),
                      // SizedBox(height: 20.v),
                      // CustomImageView(
                      //   imagePath: ImageConstant.imgGroup427,
                      //   height: 7.v,
                      // ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 152.v),
                  padding: EdgeInsets.symmetric(vertical: 67.v),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgGroup3,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(
                        flex: 32,
                      ),
                      CustomImageView(
                        radius: const BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(
                              6,
                            )),
                        imagePath: ImageConstant.imgRectangle684,
                        height: 52.v,
                        alignment: Alignment.centerRight,
                      ),
                      const Spacer(
                        flex: 63,
                      ),
                      Container(
                        height: 20.v,
                        width: 290.h,
                        decoration: BoxDecoration(
                          color: appTheme.gray800,
                          border: Border.all(
                            color: appTheme.black900,
                            width: 1.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildFour(context),
              CustomImageView(
                imagePath: ImageConstant.img4124812,
                width: 71.h,
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 19.v),
              ),
              CustomImageView(
                imagePath: ImageConstant.img21,
                height: 262.v,
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 38.v),
              ),
              CustomImageView(
                imagePath: ImageConstant.img62,
                width: 149.h,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: 69.h,
                  top: 70.v,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 380.v,
        width: 359.h,
        margin: EdgeInsets.only(top: 163.v),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img11,
              width: 365.h,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 95.v,
                width: 68.h,
                margin: EdgeInsets.only(
                  right: 40.h,
                  bottom: 13.v,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGymv12,
                      width: 68.h,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
