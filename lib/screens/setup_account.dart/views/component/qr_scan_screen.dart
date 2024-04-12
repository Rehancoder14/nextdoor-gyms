import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/component/scannedbottom_sheet.dart';
import 'package:nextdoorgym/theme/custom_button_style.dart';
import 'package:nextdoorgym/theme/custom_text_style.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerWidget extends StatefulWidget {
  const QrScannerWidget({super.key});

  @override
  State<QrScannerWidget> createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
            Positioned(
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                color: Colors.black54.withOpacity(0.7),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: 'assets/images/scanner.png',
                        ),
                        Text(
                          '  Scan QR Code',
                          style: theme.textTheme.headlineSmall!.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.18),
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                imagePath: 'assets/images/frame1.png',
                              ),
                              CustomImageView(
                                imagePath: 'assets/images/frame2.png',
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                imagePath: 'assets/images/frame3.png',
                              ),
                              CustomImageView(
                                imagePath: 'assets/images/frame4.png',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Text(
                      '  Or input manually',
                      style: theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.12,
                        left: 15,
                        right: 15,
                      ),
                      child: CustomElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const ScannedBottomSheet(
                                id: '66111b65190c6e8319fc9306',
                              );
                            },
                          );
                        },
                        text: "Input",
                        buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                        buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.04,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.05,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            top: 3, right: 3, bottom: 3, left: 12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
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
        });

        controller.pauseCamera();
        // Utils.showSnackBar(result!.code!);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ScannedBottomSheet(
              id: result!.code!,
            );
          },
        );
      }

      // Navigator.pop(context);
    });
  }
}
