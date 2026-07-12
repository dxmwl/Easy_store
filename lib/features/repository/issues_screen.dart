import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/app_localizations.dart';
import '../../../config/brutal_theme.dart';
import '../../../shared/widgets/manga_container.dart';
import '../../../core/models/github_issue.dart';
import '../../../core/api/github_api.dart';
import 'issue_detail_screen.dart';

final issuesProvider = FutureProvider.family<List<GithubIssue>, ({String owner, String repo, String state})>((ref, params) async {
  final api = ref.watch(githubApiProvider);
  return api.getIssues(params.owner, params.repo, state: params.state);
});

class IssuesScreen extends ConsumerStatefulWidget {
  final String owner;
  final String repo;

  const IssuesScreen({
    super.key,
    required this.owner,
    required this.repo,
  });

  @override
  ConsumerState<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends ConsumerState<IssuesScreen> {
  String _selectedState = 'open';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final issuesAsync = ref.watch(issuesProvider((
      owner: widget.owner,
      repo: widget.repo,
      state: _selectedState,
    )));

    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(l10n),
            _buildStateTabs(),
            Expanded(
              child: issuesAsync.when(
                data: (issues) {
                  if (issues.isEmpty) {
                    return Center(
                      child: MangaContainer(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle, size: 48, color: BrutalTheme.primary),
                            const SizedBox(height: 12),
                            Text(
                              _selectedState == 'open' ? 'NO OPEN ISSUES' : 'NO CLOSED ISSUES',
                              style: BrutalTheme.subheadingStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: issues.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildIssueItem(issues[index]),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: BrutalTheme.ink),
                ),
                error: (error, stack) => Center(
                  child: Text(l10n.loadError.toUpperCase()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(AppLocalizations l10n) {
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
          const Icon(Icons.bug_report, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'ISSUES',
              style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStateTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: BrutalTheme.canvas,
        border: Border(
          bottom: BorderSide(color: BrutalTheme.ink, width: 2),
        ),
      ),
      child: Row(
        children: [
          _buildStateTab('OPEN', 'open'),
          const SizedBox(width: 8),
          _buildStateTab('CLOSED', 'closed'),
        ],
      ),
    );
  }

  Widget _buildStateTab(String label, String state) {
    final isSelected = _selectedState == state;
    return GestureDetector(
      onTap: () => setState(() => _selectedState = state),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? BrutalTheme.primary : BrutalTheme.white,
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: const Offset(2, 2),
              blurRadius: 0,
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Arial Black',
            fontSize: 11,
            fontWeight: FontWeight.w900,
            color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildIssueItem(GithubIssue issue) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IssueDetailScreen(
              owner: widget.owner,
              repo: widget.repo,
              issue: issue,
            ),
          ),
        );
      },
      child: MangaContainer(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  issue.state == 'open' ? Icons.circle : Icons.check_circle,
                  size: 16,
                  color: issue.state == 'open'
                      ? const Color(0xFF3DDC84)
                      : BrutalTheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '#${issue.number} ${issue.title}',
                    style: const TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: BrutalTheme.ink,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (issue.labels != null && issue.labels!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: issue.labels!.map((label) {
                  final color = _parseColor(label.color);
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      label.name.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                if (issue.user != null) ...[
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(issue.user!.avatarUrl),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    issue.user!.login,
                    style: const TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 11,
                      color: BrutalTheme.disabled,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                if (issue.commentsCount != null && issue.commentsCount! > 0) ...[
                  const Icon(Icons.comment, size: 14, color: BrutalTheme.disabled),
                  const SizedBox(width: 4),
                  Text(
                    '${issue.commentsCount}',
                    style: const TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 11,
                      color: BrutalTheme.disabled,
                    ),
                  ),
                ],
                const Spacer(),
                if (issue.createdAt != null)
                  Text(
                    _formatDate(issue.createdAt!),
                    style: const TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 10,
                      color: BrutalTheme.disabled,
                    ),
                  ),
              ],
            ),
          ],
        ),
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
