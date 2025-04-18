import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/screens/setup_account.dart/model/apartment_model.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/component/select_blocks_apartment.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class SelectBlockAndApartmentScreen extends StatefulWidget {
  final ApartmentModel aptModel;
  const SelectBlockAndApartmentScreen({super.key, required this.aptModel});

  @override
  State<SelectBlockAndApartmentScreen> createState() =>
      _SelectBlockAndApartmentScreenState();
}

class _SelectBlockAndApartmentScreenState
    extends State<SelectBlockAndApartmentScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SetupAccountProvider>().buildingController.text =
          widget.aptModel.name!;
      // context.read<SetupAccountProvider>().getApartment();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2B243F),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: backgroundGradient,
          ),
          child: SingleChildScrollView(
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
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            color: Colors.grey.shade600,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
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
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1,
                              ),
                              child: CustomTextFormField(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.phone,
                                autofocus: false,
                                controller: context
                                    .read<SetupAccountProvider>()
                                    .buildingController,
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                prefix: const Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (provider.isApartmentSelected) ...[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    vertical: 4),
                                child: const Row(
                                  children: [
                                    Text(
                                      'Block',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
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
                            ],
                            if (provider.isBlockSelected) ...[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    vertical: 4),
                                child: const Row(
                                  children: [
                                    Text(
                                      'Flat',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  child: Consumer<SetupAccountProvider>(
                                    builder: (context, provider, child) {
                                      return DropdownButtonFormField<String>(
                                        dropdownColor: Colors.grey.shade300,
                                        value: provider.flat,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: appTheme.indigo150,
                                        ),
                                        elevation: 16,
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 16,
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select your flat';
                                          }
                                          return null;
                                        },
                                        onChanged: (String? newValue) {
                                          provider.flat = newValue!;
                                        },
                                        decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            hintText: 'Select flat',
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w400),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.h),
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.h),
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.h),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 10)),
                                        borderRadius: BorderRadius.circular(15),
                                        items:
                                            flat.map<DropdownMenuItem<String>>(
                                          (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                capitalizeFirstLetter(
                                                  value,
                                                ),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        );
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
          child:
              Consumer<SetupAccountProvider>(builder: (context, provider, _) {
            return CustomElevatedButton(
              onPressed: provider.isLoading
                  ? null
                  : () {
                      if (provider.apartmentBlock != null &&
                          provider.apartmentModel != null) {
                        provider.addApartment(context: context);
                      }
                    },
              buttonStyle: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  backgroundColor: appTheme.indigo150),
              text: provider.isLoading ? 'Loading..' : "Submit",
              buttonTextStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            );
          }),
        ),
      ),
    );
  }

  List<String> flat = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
  ];
}
