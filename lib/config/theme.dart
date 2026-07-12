import 'package:flutter/cupertino.dart';

class AppTheme {
  static const Color primaryColor = CupertinoColors.systemBlue;
  static const Color backgroundColor = CupertinoColors.systemBackground;
  static const Color cardColor = CupertinoColors.secondarySystemBackground;
  static const Color textColor = CupertinoColors.label;
  static const Color subtitleColor = CupertinoColors.secondaryLabel;
  
  static CupertinoThemeData get lightTheme {
    return const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      barBackgroundColor: CupertinoColors.systemBackground,
      textTheme: CupertinoTextThemeData(
        primaryColor: primaryColor,
        navLargeTitleTextStyle: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        navTitleTextStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  static CupertinoThemeData get darkTheme {
    return const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: CupertinoColors.black,
      barBackgroundColor: CupertinoColors.darkBackgroundGray,
      textTheme: CupertinoTextThemeData(
        primaryColor: primaryColor,
        navLargeTitleTextStyle: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: CupertinoColors.white,
        ),
        navTitleTextStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.white,
        ),
      ),
    );
  }

  static Color getStarColor(int stars) {
    if (stars >= 10000) return const Color(0xFFFFD700);
    if (stars >= 1000) return const Color(0xFFFFA500);
    if (stars >= 100) return const Color(0xFFFFC107);
    return CupertinoColors.systemGrey;
  }

  static String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    }
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
}
