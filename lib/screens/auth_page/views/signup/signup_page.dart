import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/auth_page/views/signup/signup_page_mobile.dart';
import 'package:nextdoorgym/widgets/common_layout_builder.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayoutBuilder(
      mobileWidget: SignupPageMobile(),
      webWidget: SignupPageMobile(),
    );
  }
}
