import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

class BrutalTag extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isSmall;

  const BrutalTag({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 6 : 8,
        vertical: isSmall ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? BrutalTheme.primary,
        border: Border.all(color: BrutalTheme.ink, width: 1.5),
        borderRadius: BorderRadius.circular(BrutalTheme.radius),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Arial Black',
          fontSize: isSmall ? 8 : 10,
          fontWeight: FontWeight.w900,
          color: textColor ?? BrutalTheme.white,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
