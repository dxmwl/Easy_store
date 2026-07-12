import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

/// Manga风格通用容器组件
/// 统一边框、阴影和圆角逻辑
class MangaContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double borderWidth;
  final bool showShadow;

  const MangaContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderWidth = 3,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? BrutalTheme.white,
        border: Border.all(color: Colors.black, width: borderWidth),
        boxShadow: showShadow
            ? const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(6, 6),
                  blurRadius: 0,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
