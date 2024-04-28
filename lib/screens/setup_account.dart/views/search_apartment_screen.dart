import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/screens/auth_page/controller/auth_provider.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class SearchApartmentScreen extends StatelessWidget {
  const SearchApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: backgroundGradient,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            color: Colors.grey.shade600,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: const Expanded(
                    child: Text(
                      'Please select Apartment/Property',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                  child: Row(
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
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomTextFormField(
                    textStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.phone,
                    autofocus: false,
                    controller:
                        context.read<AuthProvider>().mobileNumberController,
                    hintText: "Search apartment",
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    prefix: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                  child: Row(
                    children: [
                      Text(
                        'Not able to find your apartment? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Reach out to us.',
                        style: TextStyle(color: appTheme.indigo300),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomImageView(
                  imagePath: 'assets/images/searchmag.png',
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
