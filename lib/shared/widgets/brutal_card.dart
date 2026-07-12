import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

class BrutalCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const BrutalCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.backgroundColor,
  });

  @override
  State<BrutalCard> createState() => _BrutalCardState();
}

class _BrutalCardState extends State<BrutalCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: widget.onTap != null ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: widget.onTap != null ? () => setState(() => _isPressed = false) : null,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        curve: Curves.linear,
        padding: widget.padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? BrutalTheme.canvas,
          border: Border.all(color: BrutalTheme.ink, width: BrutalTheme.borderWidth),
          borderRadius: BorderRadius.circular(BrutalTheme.radius),
          boxShadow: _isPressed
              ? []
              : const [
                  BoxShadow(
                    color: BrutalTheme.ink,
                    offset: Offset(BrutalTheme.shadowOffset, BrutalTheme.shadowOffset),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: _isPressed
            ? Transform.translate(
                offset: const Offset(BrutalTheme.shadowOffset, BrutalTheme.shadowOffset),
                child: widget.child,
              )
            : widget.child,
      ),
    );
  }
}
