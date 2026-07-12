import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

class BrutalDivider extends StatelessWidget {
  final double height;
  final Color? color;

  const BrutalDivider({
    super.key,
    this.height = 2,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? BrutalTheme.ink.withValues(alpha: 0.2),
    );
  }
}
