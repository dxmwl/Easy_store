import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/brutal_theme.dart';
import '../../core/utils/platform_detector.dart';
import '../../core/models/repository.dart';
import '../../features/repository/developer_profile_screen.dart';

/// Manga风格仓库信息头部卡片
class RepoHeaderCard extends StatelessWidget {
  final Repository repo;

  const RepoHeaderCard({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final platforms = PlatformDetector.detectPlatforms(
      topics: repo.topics,
      language: repo.language,
      name: repo.name,
      description: repo.description,
    );

    return Container(
      decoration: BoxDecoration(
        color: BrutalTheme.white,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部区域：图标 + 红色装饰
          _buildTopArea(),
          // 信息区域
          _buildInfoArea(context, platforms),
        ],
      ),
    );
  }

  Widget _buildTopArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 应用图标
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: BrutalTheme.surface,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: repo.owner.avatarUrl.isNotEmpty
                ? ClipRect(
                    child: CachedNetworkImage(
                      imageUrl: repo.owner.avatarUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: Icon(Icons.code, size: 36),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.code, size: 36),
                      ),
                    ),
                  )
                : const Center(
                    child: Icon(Icons.code, size: 36),
                  ),
          ),
          const SizedBox(width: 12),
          // 红色装饰斜纹区域
          Expanded(
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: BrutalTheme.primary.withValues(alpha: 0.15),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: CustomPaint(
                painter: _StripePatternPainter(),
                child: const Center(
                  child: Icon(
                    Icons.open_in_new,
                    color: BrutalTheme.primary,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoArea(BuildContext context, List<String> platforms) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 用户名（可点击）
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeveloperProfileScreen(
                    username: repo.owner.login,
                  ),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: repo.owner.avatarUrl,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  repo.owner.login.toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: BrutalTheme.primary,
                    letterSpacing: 0.5,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // 项目名
          Text(
            repo.name.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: BrutalTheme.ink,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          // GitHub 地址
          if (repo.htmlUrl != null)
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(repo.htmlUrl!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: BrutalTheme.surface,
                  border: Border.all(color: BrutalTheme.ink, width: 1.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.link, size: 12, color: BrutalTheme.ink),
                    const SizedBox(width: 4),
                    Text(
                      repo.htmlUrl!,
                      style: const TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 10,
                        color: BrutalTheme.ink,
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          // 更新时间
          if (repo.pushedAt != null)
            Row(
              children: [
                const Icon(Icons.access_time, size: 14, color: BrutalTheme.disabled),
                const SizedBox(width: 4),
                Text(
                  'Last push ${_formatTime(repo.pushedAt!)}',
                  style: const TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 12,
                    color: BrutalTheme.disabled,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 8),
          // 描述
          if (repo.description != null)
            Text(
              repo.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Courier New',
                fontSize: 13,
                color: BrutalTheme.ink,
                height: 1.4,
              ),
            ),
          const SizedBox(height: 12),
          // 平台标签
          if (platforms.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: platforms.map((p) => _buildPlatformTag(p)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildPlatformTag(String platform) {
    String label;
    IconData icon;
    Color bgColor;

    switch (platform) {
      case 'android':
        label = 'ANDROID';
        icon = Icons.android;
        bgColor = const Color(0xFF3DDC84);
        break;
      case 'ios':
        label = 'iOS';
        icon = Icons.phone_iphone;
        bgColor = BrutalTheme.ink;
        break;
      case 'macos':
        label = 'macOS';
        icon = Icons.laptop_mac;
        bgColor = BrutalTheme.ink;
        break;
      case 'windows':
        label = 'WINDOWS';
        icon = Icons.desktop_windows;
        bgColor = const Color(0xFF0078D4);
        break;
      case 'linux':
        label = 'LINUX';
        icon = Icons.computer;
        bgColor = const Color(0xFFDD4814);
        break;
      default:
        label = platform.toUpperCase();
        icon = Icons.help_outline;
        bgColor = BrutalTheme.disabled;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays > 365) return '${(diff.inDays / 365).floor()}y ago';
    if (diff.inDays > 30) return '${(diff.inDays / 30).floor()}mo ago';
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    return '${diff.inMinutes}min ago';
  }
}

/// 红色斜纹装饰图案画笔
class _StripePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = BrutalTheme.primary.withValues(alpha: 0.3)
      ..strokeWidth = 2;

    for (double i = -size.height; i < size.width + size.height; i += 8) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
