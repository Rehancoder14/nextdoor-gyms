import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/screens/auth_page/views/login_screen.dart';
import 'package:nextdoorgym/screens/scan_amenity/controller/scanned_provider.dart';
import 'package:nextdoorgym/screens/scan_amenity/views/qr_scan_screen.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/app_decoration.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ScannedAmenityProvider>().getScanAmenity();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: const CircleAvatar(
                      radius: 30,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      LocalStoragaeService.getUserValue(
                        UserField.userName,
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                onTap: () async {
                  LocalStoragaeService.deleteUserData();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (Route<dynamic> route) =>
                        false, // This makes sure that all previous screens are removed
                  );
                },
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
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
                        style:
                            theme.textTheme.bodyLarge!.copyWith(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 16.v),
                    _buildTwentyFive(context),
                    SizedBox(height: 16.v),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        "How it works?",
                        style:
                            theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
                      ),
                    ),
                    buildInstructions(),
                    buildInstructions(),
                    buildInstructions(),
                    const SizedBox(height: 20),
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
          Positioned(
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar:
          Consumer<ScannedAmenityProvider>(builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                backgroundColor: appTheme.indigo150),
            onPressed: provider.isLoading
                ? null
                : () {
                    log(provider.getScanAmenityModel.toString());
                    if (provider.getScanAmenityModel != null) {
                      provider.returnScanAmenity(
                          context: context,
                          amenityId: provider.getScanAmenityModel!.id!);
                    } else {
                      log(
                        LocalStoragaeService.getUserValue(UserField.userName)
                            .toString(),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QrScannerWidget(),
                        ),
                      );
                    }
                  },
            child: provider.isLoading
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      provider.getScanAmenityModel == null
                          ? 'Check in'
                          : 'Checkout',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
          ),
        );
      }),
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
