import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/setup_account.dart/model/amenity_model.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';
import 'package:nextdoorgym/widgets/custom_image_view.dart';

class SuccessfulScanPage extends StatelessWidget {
  final AmenitiesModel amenity;
  const SuccessfulScanPage({super.key, required this.amenity});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (Route<dynamic> route) =>
              false, // This makes sure that all previous screens are removed
        );
      },
      child: SafeArea(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'You have successfully checked in at ${amenity.building!.name} - ${amenity.name}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${amenity.building!.name} - ${amenity.name}',
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Checked in successfully',
                        style: TextStyle(fontSize: 15, color: Colors.green),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomImageView(
                  imagePath: 'assets/images/cardimage.png',
                ),
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: appTheme.indigo50.withOpacity(
                      0.2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "Policies",
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      _buildPolicies(
                        'assets/images/infinity.png',
                        'Unlimited access',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing',
                      ),
                      _buildPolicies(
                        'assets/images/checkright.png',
                        'Safe Workout',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing',
                      ),
                      _buildPolicies(
                        'assets/images/pause.png',
                        'Pause Workout',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: CustomElevatedButton(
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
                    buttonStyle: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        backgroundColor: appTheme.indigo150),
                    text: "Check out",
                    buttonTextStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPolicies(String image, String title, String subtitle) {
  return ListTile(
    leading: CustomImageView(
      imagePath: image,
      height: 25,
    ),
    title: Text(title),
    subtitle: Text(subtitle),
  );
}
