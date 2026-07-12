import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

/// Manga风格统计数据网格
class StatsGrid extends StatelessWidget {
  final int? forks;
  final int? stars;
  final int? issues;
  final int? downloads;
  final String? license;
  final VoidCallback? onIssuesTap;

  const StatsGrid({
    super.key,
    this.forks,
    this.stars,
    this.issues,
    this.downloads,
    this.license,
    this.onIssuesTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 第一行：三个方块
        Row(
          children: [
            Expanded(
              child: _buildStatBox(
                label: 'BRANCHES',
                value: forks != null ? _formatNumber(forks!) : '-',
                icon: Icons.call_split,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatBox(
                label: 'STARS',
                value: stars != null ? _formatNumber(stars!) : '-',
                icon: Icons.star,
                valueColor: BrutalTheme.primary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatBox(
                label: 'ISSUES',
                value: issues != null ? _formatNumber(issues!) : '-',
                icon: Icons.error_outline,
                onTap: onIssuesTap,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // 第二行：两个长条
        Row(
          children: [
            Expanded(
              child: _buildStatBox(
                label: 'DOWNLOADS',
                value: downloads != null ? _formatNumber(downloads!) : '-',
                icon: Icons.download,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatBox(
                label: 'LICENSE',
                value: license?.toUpperCase() ?? '-',
                icon: Icons.gavel,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatBox({
    required String label,
    required String value,
    required IconData icon,
    Color? valueColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: BrutalTheme.white,
          border: Border.all(color: Colors.black, width: 2.5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 16, color: BrutalTheme.ink),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: valueColor ?? BrutalTheme.ink,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: onTap != null ? BrutalTheme.primary : BrutalTheme.disabled,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    if (number >= 1000) return '${(number / 1000).toStringAsFixed(1)}K';
    return number.toString();
  }
}
