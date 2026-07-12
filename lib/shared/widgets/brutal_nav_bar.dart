import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

class BrutalNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BrutalNavItem> items;

  const BrutalNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BrutalTheme.canvas,
        border: Border(
          top: BorderSide(color: BrutalTheme.ink, width: BrutalTheme.borderWidth),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = index == currentIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: isSelected ? BrutalTheme.primary : Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item.icon,
                        color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Arial Black',
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BrutalNavItem {
  final IconData icon;
  final String label;

  const BrutalNavItem({
    required this.icon,
    required this.label,
  });
}
