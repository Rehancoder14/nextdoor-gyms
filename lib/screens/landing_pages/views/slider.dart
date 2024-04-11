import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/landing_pages/views/splash_screenone_screen/splash_screenone_screen.dart';
import 'package:nextdoorgym/screens/landing_pages/views/splash_screentwo_screen/splash_screentwo_screen.dart';
import 'package:nextdoorgym/screens/auth_page/views/login_screen.dart';
import 'package:nextdoorgym/screens/setup_account.dart/views/setup_account_screen.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/widgets/custom_elevated_button.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const <Widget>[
                SplashScreentwoScreen(),
                SplashScreenoneScreen(),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2, // number of pages
                  (index) => buildDot(index),
                ),
              ),
              if (_currentPage == 1) ...[
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomElevatedButton(
                    onPressed: () {
                      navigateBasedOnToken();
                    },
                    text: 'Next',
                    buttonTextStyle: const TextStyle(color: Colors.white),
                    buttonStyle: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            15,
                          ),
                          bottomRight: Radius.circular(
                            15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? PrimaryColors().indigo300 : Colors.grey,
      ),
    );
  }

//write again
  void navigateBasedOnToken() {
    if (LocalStoragaeService.getUserValue(UserField.token) == null &&
        LocalStoragaeService.getUserValue(UserField.isAccountSetup) == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } else if (LocalStoragaeService.getUserValue(UserField.token) != null &&
        !LocalStoragaeService.getUserValue(UserField.isAccountSetup)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SetupAccountScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }
}
