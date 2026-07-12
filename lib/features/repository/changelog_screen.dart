import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../l10n/app_localizations.dart';
import '../../../config/brutal_theme.dart';
import '../../../shared/widgets/manga_container.dart';
import '../../../core/models/release.dart';

class ChangelogScreen extends StatelessWidget {
  final Release release;

  const ChangelogScreen({super.key, required this.release});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context, l10n),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 版本标签
                    _buildVersionHeader(),
                    const SizedBox(height: 16),
                    // 更新日志内容
                    _buildContent(l10n),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: BrutalTheme.canvas,
        border: Border(
          bottom: BorderSide(color: BrutalTheme.ink, width: BrutalTheme.borderWidth),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: BrutalTheme.white,
                border: Border.all(color: BrutalTheme.ink, width: 2),
              ),
              child: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.description, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.changelog.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: BrutalTheme.primary,
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 3),
                blurRadius: 0,
              ),
            ],
          ),
          child: Text(
            release.tagName,
            style: const TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: BrutalTheme.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
        if (release.prerelease == true) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: BrutalTheme.ink,
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: const Text(
              'BETA',
              style: TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 10,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.white,
              ),
            ),
          ),
        ],
        const Spacer(),
        if (release.publishedAt != null)
          Text(
            _formatDate(release.publishedAt!),
            style: const TextStyle(
              fontFamily: 'Courier New',
              fontSize: 12,
              color: BrutalTheme.disabled,
            ),
          ),
      ],
    );
  }

  Widget _buildContent(AppLocalizations l10n) {
    if (release.body == null || release.body!.isEmpty) {
      return MangaContainer(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            l10n.noReleaseNotes.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 14,
              color: BrutalTheme.disabled,
            ),
          ),
        ),
      );
    }

    return MangaContainer(
      child: MarkdownBody(
        data: release.body!,
        selectable: true,
        styleSheet: MarkdownStyleSheet(
          p: const TextStyle(
            fontFamily: 'Courier New',
            fontSize: 14,
            color: BrutalTheme.ink,
            height: 1.6,
          ),
          h1: const TextStyle(
            fontFamily: 'Arial Black',
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: BrutalTheme.ink,
          ),
          h2: const TextStyle(
            fontFamily: 'Arial Black',
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: BrutalTheme.ink,
          ),
          h3: const TextStyle(
            fontFamily: 'Arial Black',
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: BrutalTheme.ink,
          ),
          listBullet: const TextStyle(
            fontFamily: 'Courier New',
            fontSize: 14,
            color: BrutalTheme.primary,
          ),
          code: const TextStyle(
            fontFamily: 'Courier New',
            fontSize: 12,
            color: BrutalTheme.ink,
            backgroundColor: BrutalTheme.surface,
          ),
          codeblockDecoration: BoxDecoration(
            color: BrutalTheme.surface,
            border: Border.all(color: BrutalTheme.ink, width: 1),
          ),
          a: const TextStyle(
            fontFamily: 'Courier New',
            fontSize: 14,
            color: BrutalTheme.primary,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
