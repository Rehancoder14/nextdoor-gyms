import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/landing_pages/views/slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/landing_page.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: _showSlider
                ? const SliderScreen() // handle auth guard
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
