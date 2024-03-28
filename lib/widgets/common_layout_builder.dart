import 'package:flutter/material.dart';

class CommonLayoutBuilder extends StatelessWidget {
  final Widget webWidget;
  final Widget mobileWidget;

  const CommonLayoutBuilder(
      {Key? key, required this.mobileWidget, required this.webWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 650) {
          return webWidget;
        } else {
          return mobileWidget;
        }
      },
    );
  }
}
