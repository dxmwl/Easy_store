import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../l10n/app_localizations.dart';
import '../../../config/brutal_theme.dart';
import '../../../shared/widgets/manga_container.dart';
import '../../../core/models/github_issue.dart';
import '../../../core/models/github_comment.dart';
import '../../../core/api/github_api.dart';

final commentsProvider = FutureProvider.family<List<GithubComment>, ({String owner, String repo, int issueNumber})>((ref, params) async {
  final api = ref.watch(githubApiProvider);
  return api.getComments(params.owner, params.repo, params.issueNumber);
});

class IssueDetailScreen extends ConsumerWidget {
  final String owner;
  final String repo;
  final GithubIssue issue;

  const IssueDetailScreen({
    super.key,
    required this.owner,
    required this.repo,
    required this.issue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final commentsAsync = ref.watch(commentsProvider((
      owner: owner,
      repo: repo,
      issueNumber: issue.number,
    )));

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
                    _buildHeader(),
                    const SizedBox(height: 16),
                    if (issue.labels != null && issue.labels!.isNotEmpty)
                      _buildLabels(),
                    const SizedBox(height: 16),
                    _buildAuthorInfo(),
                    const SizedBox(height: 16),
                    _buildContent(),
                    const SizedBox(height: 24),
                    // 评论/回复列表
                    _buildCommentsSection(commentsAsync),
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
          Expanded(
            child: Text(
              'ISSUE #${issue.number}',
              style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (issue.htmlUrl != null) {
                final url = Uri.parse(issue.htmlUrl!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: BrutalTheme.primary,
                border: Border.all(color: BrutalTheme.ink, width: 2),
              ),
              child: const Icon(Icons.open_in_new, size: 18, color: BrutalTheme.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return MangaContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                issue.state == 'open' ? Icons.circle : Icons.check_circle,
                size: 20,
                color: issue.state == 'open'
                    ? const Color(0xFF3DDC84)
                    : BrutalTheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  issue.title,
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
        ],
      ),
    );
  }

  Widget _buildLabels() {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: issue.labels!.map((label) {
        final color = _parseColor(label.color);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Text(
            label.name.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAuthorInfo() {
    return MangaContainer(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          if (issue.user != null) ...[
            ClipOval(
              child: Image.network(
                issue.user!.avatarUrl,
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              issue.user!.login,
              style: const TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.ink,
              ),
            ),
          ],
          const Spacer(),
          if (issue.createdAt != null)
            Text(
              'opened ${_formatDate(issue.createdAt!)}',
              style: const TextStyle(
                fontFamily: 'Courier New',
                fontSize: 11,
                color: BrutalTheme.disabled,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (issue.body == null || issue.body!.isEmpty) {
      return const MangaContainer(
        child: Text(
          'No description provided.',
          style: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 13,
            color: BrutalTheme.disabled,
          ),
        ),
      );
    }

    return MangaContainer(
      child: MarkdownBody(
        data: issue.body!,
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
          ),
        ),
      ),
    );
  }

  Widget _buildCommentsSection(AsyncValue<List<GithubComment>> commentsAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题
        Row(
          children: [
            const Text(
              'COMMENTS',
              style: TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.ink,
              ),
            ),
            const SizedBox(width: 8),
            if (issue.commentsCount != null && issue.commentsCount! > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: BrutalTheme.primary,
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: Text(
                  '${issue.commentsCount}',
                  style: const TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: BrutalTheme.white,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        // 评论列表
        commentsAsync.when(
          data: (comments) {
            if (comments.isEmpty) {
              return MangaContainer(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    'NO COMMENTS YET',
                    style: TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 12,
                      color: BrutalTheme.disabled,
                    ),
                  ),
                ),
              );
            }
            return Column(
              children: comments.map((comment) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildCommentItem(comment),
              )).toList(),
            );
          },
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(color: BrutalTheme.ink),
            ),
          ),
          error: (error, stack) => MangaContainer(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Failed to load comments',
              style: TextStyle(color: BrutalTheme.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentItem(GithubComment comment) {
    return MangaContainer(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 评论者信息
          Row(
            children: [
              if (comment.user != null) ...[
                ClipOval(
                  child: Image.network(
                    comment.user!.avatarUrl,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  comment.user!.login,
                  style: const TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: BrutalTheme.ink,
                  ),
                ),
              ],
              const Spacer(),
              if (comment.createdAt != null)
                Text(
                  _formatDate(comment.createdAt!),
                  style: const TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 10,
                    color: BrutalTheme.disabled,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // 评论内容
          MarkdownBody(
            data: comment.body,
            selectable: true,
            styleSheet: MarkdownStyleSheet(
              p: const TextStyle(
                fontFamily: 'Courier New',
                fontSize: 13,
                color: BrutalTheme.ink,
                height: 1.5,
              ),
              code: const TextStyle(
                fontFamily: 'Courier New',
                fontSize: 11,
                color: BrutalTheme.ink,
                backgroundColor: BrutalTheme.surface,
              ),
              a: const TextStyle(
                fontFamily: 'Courier New',
                fontSize: 13,
                color: BrutalTheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _parseColor(String? hexColor) {
    if (hexColor == null) return BrutalTheme.disabled;
    try {
      return Color(int.parse('FF$hexColor', radix: 16));
    } catch (e) {
      return BrutalTheme.disabled;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays > 365) return '${(diff.inDays / 365).floor()}y ago';
    if (diff.inDays > 30) return '${(diff.inDays / 30).floor()}mo ago';
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    return '${diff.inMinutes}m ago';
  }
}
