import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/component/select_apartment_dropdown.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/component/select_blocks_apartment.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

class SelectBlockAndApartmentScreen extends StatefulWidget {
  const SelectBlockAndApartmentScreen({super.key});

  @override
  State<SelectBlockAndApartmentScreen> createState() =>
      _SelectBlockAndApartmentScreenState();
}

class _SelectBlockAndApartmentScreenState
    extends State<SelectBlockAndApartmentScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SetupAccountProvider>().getApartment();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (Route<dynamic> route) =>
                              false, // This makes sure that all previous screens are removed
                        );
                      },
                      icon: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Hi, ${capitalizeFirstLetter(
                        LocalStoragaeService.getUserValue(
                          UserField.userName,
                        ),
                      )},',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: const Text(
                  'Please select Apartment/Property',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomImageView(
                imagePath: 'assets/images/aptimage.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Consumer<SetupAccountProvider>(builder: (context, provider, _) {
                return provider.isBuildingLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.08,
                              vertical: 4,
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  'Apartment name',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1,
                            ),
                            child: const ApartmentSelectDropDown(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (provider.isApartmentSelected) ...[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.08,
                                  vertical: 4),
                              child: const Row(
                                children: [
                                  Text(
                                    'Block',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1,
                              ),
                              child: const BlockSelectDropDown(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: MediaQuery.of(context).size.width * 0.08,
                          //       vertical: 4),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         'Flat',
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: MediaQuery.of(context).size.width * 0.1,
                          //   ),
                          //   child: const ApartmentSelectDropDown(),
                          // ),
                        ],
                      );
              }),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            buttonStyle: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                backgroundColor: appTheme.indigo150),
            text: "Done",
            buttonTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
