import 'package:flutter/material.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Display text style
  static get displayMedium46 => theme.textTheme.displayMedium!.copyWith(
        fontSize: 46.fSize,
      );
  // Title text style
  static get titleLargeBlack9004c => theme.textTheme.titleLarge!.copyWith(
      color: appTheme.black900, fontWeight: FontWeight.w500, fontSize: 16);
}

extension on TextStyle {
  TextStyle get droidSans {
    return copyWith(
      fontFamily: 'Droid Sans',
    );
  }
}
