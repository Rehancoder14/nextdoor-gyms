import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/select_apartment_screen.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class ScannedApartmentBottomSheet extends StatefulWidget {
  final String id;

  const ScannedApartmentBottomSheet({
    super.key,
    required this.id,
  });

  @override
  State<ScannedApartmentBottomSheet> createState() =>
      _ScannedApartmentBottomSheetState();
}

class _ScannedApartmentBottomSheetState
    extends State<ScannedApartmentBottomSheet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SetupAccountProvider>().getApartmentById(
            id: widget.id,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
                : Column(
                    children: <Widget>[
                      const Text(
                        "Apartment",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Id: ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              provider.apartmentModel!.id ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Apartment: ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              provider.apartmentModel!.name ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Contact: ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              provider.apartmentModel!.contact ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
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
                                builder: (context) =>
                                    SelectBlockAndApartmentScreen(
                                  aptModel: provider.apartmentModel!,
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
