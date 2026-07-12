import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

class BrutalTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final bool autofocus;

  const BrutalTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.placeholder,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BrutalTheme.white,
        border: Border.all(color: BrutalTheme.ink, width: BrutalTheme.borderWidth),
        borderRadius: BorderRadius.circular(BrutalTheme.radius),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus,
        onChanged: onChanged,
        onSubmitted: onSubmitted != null ? (_) => onSubmitted!() : null,
        style: BrutalTheme.bodyStyle.copyWith(fontSize: 14),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: BrutalTheme.bodyStyle.copyWith(
            color: BrutalTheme.disabled,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: BrutalTheme.ink,
            size: 20,
          ),
        ),
      ),
    );
  }
}
