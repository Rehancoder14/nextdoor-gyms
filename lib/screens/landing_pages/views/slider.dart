import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/landing_pages/views/splash_screenone_screen/splash_screenone_screen.dart';
import 'package:nextdoorgym/screens/landing_pages/views/splash_screentwo_screen/splash_screentwo_screen.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const <Widget>[
          SplashScreentwoScreen(),
          SplashScreenoneScreen()
        ],
      ),
    );
  }
}
