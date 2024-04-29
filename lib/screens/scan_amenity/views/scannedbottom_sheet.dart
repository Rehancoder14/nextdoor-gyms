import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/screens/home_page/views/succesful_scan_page.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class ScannedBottomSheet extends StatefulWidget {
  final String id;

  const ScannedBottomSheet({
    super.key,
    required this.id,
  });

  @override
  State<ScannedBottomSheet> createState() => _ScannedBottomSheetState();
}

class _ScannedBottomSheetState extends State<ScannedBottomSheet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SetupAccountProvider>().getAmenityForUser(
          id: widget.id,
          buildingId: LocalStoragaeService.getUserValue(
            UserField.buildingInternalId,
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Center(
        child: Consumer<SetupAccountProvider>(
          builder: (context, provider, _) {
            return provider.isBottomSheetLoading
                ? const CircularProgressIndicator()
                : provider.amenitiesModel == null
                    ? const Center(
                        child: Text(
                          'Wrong Qr code scan',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          const Text(
                            "Amenity",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Amenity: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  provider.amenitiesModel?.name ?? 'N/A',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Count: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  provider.amenitiesModel!.count.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "CustomId: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  provider.amenitiesModel!.customId ?? 'N/A',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Description: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  provider.amenitiesModel!.description ?? 'N/A',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: CustomElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SuccessfulScanPage(
                                      amenity: provider.amenitiesModel!,
                                    ),
                                  ),
                                  (Route<dynamic> route) =>
                                      false, // This makes sure that all previous screens are removed
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
                        ],
                      );
          },
        ),
      ),
    );
  }
}
