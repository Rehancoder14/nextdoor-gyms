import 'package:flutter/material.dart';

String capitalizeFirstLetter(String text) {
  return text[0].toUpperCase() + text.substring(1);
}

LinearGradient backgroundGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.black,
    Color(
      0xFF2B243F,
    ),
  ],
);
