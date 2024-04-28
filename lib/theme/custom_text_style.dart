// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumDroidSans =>
      theme.textTheme.bodyMedium!.droidSans.copyWith(
        color: Colors.white,
        fontSize: 13.fSize,
      );
  static get bodyMediumDroidSans14 =>
      theme.textTheme.bodyMedium!.droidSans.copyWith(
        color: Colors.white,
        fontSize: 14.fSize,
      );
  static get bodyMediumDroidSansOnPrimary =>
      theme.textTheme.bodyMedium!.droidSans.copyWith(
        color: Colors.white,
        fontSize: 14.fSize,
      );
  static get bodyMediumDroidSansPrimaryContainer =>
      theme.textTheme.bodyMedium!.droidSans.copyWith(
        color: Colors.white,
        fontSize: 13.fSize,
      );
  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
      fontSize: 20.fSize, fontWeight: FontWeight.w500, color: Colors.black87);
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 20.fSize,
      );
  static get titleLargeBlack900Bold => theme.textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 20.fSize,
      );
  static get titleLargeOnPrimaryContainer20 =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 20.fSize,
      );
  static get titleLargeff000000 => theme.textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 20.fSize,
      );
  static get titleLargeff00000020 => theme.textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 20.fSize,
      );
  static get titleLargeff010101 => theme.textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 20.fSize,
      );
  static get titleLargeff010101Bold => theme.textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: Colors.white,
      );
}

extension on TextStyle {
  TextStyle get droidSans {
    return copyWith(
      fontFamily: 'Droid Sans',
    );
  }

  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
