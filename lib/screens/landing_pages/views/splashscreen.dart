import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page.dart';
import 'package:nextdoorgym/screens/landing_pages/views/slider.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showSlider = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showSlider = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2B243F),
                    Colors.black,
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  height: 70,
                  width: 280,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/waterimage.png',
                        ),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.black12.withOpacity(
                    //     0.001), // Semi-transparent white color for the glass effect
                    color: Colors.black12,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                      ),
                      Text(
                        'Nextdoor',
                        style: theme.textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          height: 1,
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Image.asset('assets/images/dumbell2.png'),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Image.asset('assets/images/shuttle2.png'),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              child: Image.asset('assets/images/shoe2.png'),
            ),
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height * 0.21,
              child: Image.asset('assets/images/bat2.png'),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              right: 10,
              child: Image.asset('assets/images/dumbell.png'),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.28,
              right: 20,
              child: Image.asset('assets/images/shuttle.png'),
            ),
            Positioned(
              left: 20,
              bottom: MediaQuery.of(context).size.height * 0.24,
              child: Image.asset('assets/images/shoe.png'),
            ),
            Positioned(
              right: 100,
              bottom: 100,
              child: Image.asset('assets/images/bat.png'),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              child: Image.asset(
                'assets/images/barbell.png',
                height: 150,
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: _showSlider
                  ? _navigateBasedOnToken() // handle auth guard
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigateBasedOnToken() {
    if (LocalStoragaeService.getUserValue(UserField.token) == null &&
            LocalStoragaeService.getUserValue(UserField.isAccountSetup) ==
                null ||
        !LocalStoragaeService.getUserValue(UserField.isAccountSetup)) {
      return const SliderScreen();
    }
    return const HomePage();
  }
}
