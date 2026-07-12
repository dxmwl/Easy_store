import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

class HalftonePattern extends StatelessWidget {
  final Widget child;
  final double opacity;
  final double dotSize;
  final double spacing;

  const HalftonePattern({
    super.key,
    required this.child,
    this.opacity = 0.06,
    this.dotSize = 2.0,
    this.spacing = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HalftonePainter(
        opacity: opacity,
        dotSize: dotSize,
        spacing: spacing,
      ),
      child: child,
    );
  }
}

class HalftonePainter extends CustomPainter {
  final double opacity;
  final double dotSize;
  final double spacing;

  HalftonePainter({
    required this.opacity,
    required this.dotSize,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = BrutalTheme.ink.withValues(alpha: opacity)
      ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
