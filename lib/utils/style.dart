import 'package:cambridge_wealth/utils/size_config.dart';
import 'package:flutter/material.dart';

class ColorShades {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color blackShade = Color(0xff202020);
  static const Color yellow = Color(0xffffab49);
}

extension CustomColorScheme on ColorScheme {
  Color get textPrimary => ColorShades.white;

  Color get blackShade => ColorShades.blackShade;

  Color get primaryColor => ColorShades.yellow;
}

extension CustomTextTheme on TextTheme {
  TextStyle get h1 => TextStyle(
        fontSize: SizeConfig.getFontSize(start: 20, end: 24),
        fontWeight: FontWeight.w600,
        color: ColorShades.white,
      );

  TextStyle get h2 => TextStyle(
        fontSize: SizeConfig.getFontSize(start: 14, end: 20),
        fontWeight: FontWeight.w400,
        color: ColorShades.white,
      );

  TextStyle get body1Regular => TextStyle(
        fontSize: SizeConfig.getFontSize(start: 12, end: 16),
        fontWeight: FontWeight.w400,
        color: ColorShades.white,
      );

  TextStyle get body1Medium => const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w600, color: ColorShades.white);

  TextStyle get body1Normal => const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: ColorShades.white);

  TextStyle get body2Regular => const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w300, color: ColorShades.white);
}

class Spacing {
  static const double minSpacing = 4;

  static const double space4 = minSpacing * 1; // 4
  static const double space8 = minSpacing * 2; // 8
  static const double space12 = minSpacing * 3; // 12
  static const double space16 = minSpacing * 4; // 16
  static const double space20 = minSpacing * 5; // 20
  static const double space24 = minSpacing * 6; // 24
  static const double space28 = minSpacing * 7; // 28
  static const double space32 = minSpacing * 8; // 32
  static const double space36 = minSpacing * 9; // 36
  static const double space40 = minSpacing * 10; // 40
  static const double space44 = minSpacing * 11; // 44
  static const double space48 = minSpacing * 12; // 48
  static const double space52 = minSpacing * 13; // 52
  static const double space56 = minSpacing * 14; // 56
  static const double space60 = minSpacing * 15; // 60
  static const double space64 = minSpacing * 16; // 64
}

class Gradients {
  static const LinearGradient backGround = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: [
        0.6,
        0.9,
      ],
      colors: [
        Colors.black,
        Colors.transparent
      ]);
}

extension ThemeFromContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Size get displaySize => MediaQuery.of(this).size;

  double get displayWidth => MediaQuery.of(this).size.width;

  double get displayHeight => MediaQuery.of(this).size.height;
}
