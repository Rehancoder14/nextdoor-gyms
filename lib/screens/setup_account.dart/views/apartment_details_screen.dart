import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nextdoorgym/constants/image_constants.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/app_decoration.dart';
import 'package:nextdoorgym/theme/custom_button_style.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ApartmentDetailsScreen extends StatefulWidget {
  const ApartmentDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ApartmentDetailsScreen> createState() => _ApartmentDetailsScreenState();
}

class _ApartmentDetailsScreenState extends State<ApartmentDetailsScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool showQrScanner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 41.v,
                ),
                decoration: AppDecoration.fillWhiteA700,
                child: SingleChildScrollView(
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
                          style:
                              CustomTextStyles.titleLargeOnPrimaryContainer20,
                        ),
                      ),
                      SizedBox(height: 46.v),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgTelevision,
                              height: 26.v,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                "Tap on image below to scan the qr",
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                style: theme.textTheme.headlineSmall!
                                    .copyWith(fontSize: 18),
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
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showQrScanner = true;
                              });
                            },
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
                                  child: showQrScanner
                                      ? QRView(
                                          key: qrKey,
                                          onQRViewCreated: _onQRViewCreated,
                                        )
                                      : SizedBox(
                                          height: 232.v,
                                          width: 224.h,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.img4611,
                                                width: 224.h,
                                                alignment: Alignment.center,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 48.v),
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
                      ),
                      SizedBox(height: 42.v),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Or input manually",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        hintText: 'Enter your building',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your building name";
                          }
                          return null;
                        },
                        textStyle: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                        controller: context
                            .read<SetupAccountProvider>()
                            .buildingController,
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400),
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 50.v),
                      Consumer<SetupAccountProvider>(
                          builder: (context, provider, _) {
                        return Stack(
                          children: [
                            CustomElevatedButton(
                              onPressed: () {
                                log(LocalStoragaeService.getUserValue(
                                        UserField.token)
                                    .toString());
                                log(LocalStoragaeService.getUserValue(
                                        UserField.isAccountSetup)
                                    .toString());
                                // provider.addApartment(context: context);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              },
                              text: provider.isLoading ? '' : "Input",
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
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 32.v),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        setState(() {
          result = scanData;
          showQrScanner = false;
          String qrdata = result!.code!;

          context.read<SetupAccountProvider>().buildingController.text = qrdata;
        });
        controller.pauseCamera();
      }

      // Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
