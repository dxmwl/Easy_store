import 'package:flutter/material.dart';

class BrutalTheme {
  BrutalTheme._();

  static const Color canvas = Color(0xFFFDFBF7);
  static const Color primary = Color(0xFFD32F2F);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color surface = Color(0xFFF5F5DC);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color white = Color(0xFFFFFFFF);

  static const double borderWidth = 2.5;
  static const double radius = 2.0;
  static const double shadowOffset = 4.0;
  static const double shadowOffsetSm = 2.0;

  static BoxDecoration get cardDecoration => BoxDecoration(
        color: canvas,
        border: Border.all(color: ink, width: borderWidth),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: ink,
            offset: Offset(shadowOffset, shadowOffset),
            blurRadius: 0,
          ),
        ],
      );

  static BoxDecoration get cardDecorationPressed => BoxDecoration(
        color: canvas,
        border: Border.all(color: ink, width: borderWidth),
        borderRadius: BorderRadius.circular(radius),
      );

  static BoxDecoration get primaryButtonDecoration => BoxDecoration(
        color: primary,
        border: Border.all(color: ink, width: borderWidth),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: ink,
            offset: Offset(shadowOffsetSm, shadowOffsetSm),
            blurRadius: 0,
          ),
        ],
      );

  static BoxDecoration get primaryButtonPressedDecoration => BoxDecoration(
        color: primary,
        border: Border.all(color: ink, width: borderWidth),
        borderRadius: BorderRadius.circular(radius),
      );

  static BoxDecoration get outlinedDecoration => BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: ink, width: borderWidth),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: ink,
            offset: Offset(shadowOffsetSm, shadowOffsetSm),
            blurRadius: 0,
          ),
        ],
      );

  static TextStyle get headingStyle => const TextStyle(
        fontFamily: 'Arial Black',
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: ink,
        letterSpacing: 0.5,
      );

  static TextStyle get subheadingStyle => const TextStyle(
        fontFamily: 'Arial',
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: ink,
        letterSpacing: 0.3,
      );

  static TextStyle get bodyStyle => const TextStyle(
        fontFamily: 'Courier New',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ink,
        height: 1.4,
      );

  static TextStyle get labelStyle => const TextStyle(
        fontFamily: 'Arial Black',
        fontSize: 10,
        fontWeight: FontWeight.w900,
        color: white,
        letterSpacing: 1.2,
      );

  static TextStyle get metaStyle => const TextStyle(
        fontFamily: 'Courier New',
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: ink,
      );
}
