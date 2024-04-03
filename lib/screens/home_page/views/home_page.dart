import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page_mobile.dart';
import 'package:nextdoorgym/screens/home_page/views/home_page_web.dart';
import 'package:nextdoorgym/widgets/common_layout_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CommonLayoutBuilder(
      mobileWidget: HomePageMobile(),
      webWidget: HomePageWeb(),
    );
  }
}
