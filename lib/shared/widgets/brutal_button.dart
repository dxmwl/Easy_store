import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

class BrutalButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final EdgeInsets? padding;

  const BrutalButton({
    super.key,
    required this.child,
    this.onPressed,
    this.isPrimary = true,
    this.padding,
  });

  @override
  State<BrutalButton> createState() => _BrutalButtonState();
}

class _BrutalButtonState extends State<BrutalButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: widget.onPressed != null ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: widget.onPressed != null ? () => setState(() => _isPressed = false) : null,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        curve: Curves.linear,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: widget.isPrimary ? BrutalTheme.primary : BrutalTheme.canvas,
          border: Border.all(color: BrutalTheme.ink, width: BrutalTheme.borderWidth),
          borderRadius: BorderRadius.circular(BrutalTheme.radius),
          boxShadow: _isPressed
              ? []
              : [
                  const BoxShadow(
                    color: BrutalTheme.ink,
                    offset: Offset(BrutalTheme.shadowOffsetSm, BrutalTheme.shadowOffsetSm),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: _isPressed
            ? Transform.translate(
                offset: const Offset(BrutalTheme.shadowOffsetSm, BrutalTheme.shadowOffsetSm),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: widget.isPrimary ? BrutalTheme.white : BrutalTheme.ink,
                    fontFamily: 'Arial Black',
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                    letterSpacing: 1,
                  ),
                  child: widget.child,
                ),
              )
            : DefaultTextStyle(
                style: TextStyle(
                  color: widget.isPrimary ? BrutalTheme.white : BrutalTheme.ink,
                  fontFamily: 'Arial Black',
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: 1,
                ),
                child: widget.child,
              ),
      ),
    );
  }
}
