import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/auth_page/views/login/login_page_mobile.dart';
import 'package:nextdoorgym/screens/auth_page/views/login/login_page_web.dart';
import 'package:nextdoorgym/widgets/common_layout_builder.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CommonLayoutBuilder(
      mobileWidget: LoginPageMobile(),
      webWidget: LoginPageWeb(),
    );
  }
}
