import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/manga_container.dart';
import '../../core/models/github_user.dart';
import '../../core/models/repository.dart';
import '../../core/api/github_api.dart';
import '../repository/repository_screen.dart';

final userProvider = FutureProvider.family<GithubUser, String>((ref, username) async {
  final api = ref.watch(githubApiProvider);
  return api.getUser(username);
});

final userReposProvider = FutureProvider.family<List<Repository>, String>((ref, username) async {
  final api = ref.watch(githubApiProvider);
  return api.getUserRepos(username);
});

class DeveloperProfileScreen extends ConsumerWidget {
  final String username;

  const DeveloperProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final userAsync = ref.watch(userProvider(username));
    final reposAsync = ref.watch(userReposProvider(username));

    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context, l10n),
            Expanded(
              child: userAsync.when(
                data: (user) => _buildContent(context, user, reposAsync, l10n),
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
          const Icon(Icons.person, size: 24),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'DEVELOPER',
              style: TextStyle(
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

  Widget _buildContent(BuildContext context, GithubUser user, AsyncValue<List<Repository>> reposAsync, AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserProfile(context, user),
          const SizedBox(height: 24),
          _buildUserStats(user),
          const SizedBox(height: 24),
          _buildUserRepos(context, reposAsync, l10n),
        ],
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context, GithubUser user) {
    return MangaContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.avatarUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? user.login,
                  style: const TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: BrutalTheme.ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@${user.login}',
                  style: const TextStyle(
                    fontFamily: 'Courier New',
                    fontSize: 14,
                    color: BrutalTheme.disabled,
                  ),
                ),
                if (user.bio != null && user.bio!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    user.bio!,
                    style: const TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 13,
                      color: BrutalTheme.ink,
                      height: 1.4,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(user.htmlUrl ?? 'https://github.com/${user.login}');
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
                          user.htmlUrl ?? 'https://github.com/${user.login}',
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserStats(GithubUser user) {
    return Row(
      children: [
        Expanded(child: _buildStatBox('REPOS', '${user.publicRepos ?? 0}', Icons.folder)),
        const SizedBox(width: 8),
        Expanded(child: _buildStatBox('FOLLOWERS', '${user.followers ?? 0}', Icons.people)),
        const SizedBox(width: 8),
        Expanded(child: _buildStatBox('FOLLOWING', '${user.following ?? 0}', Icons.person_add)),
      ],
    );
  }

  Widget _buildStatBox(String label, String value, IconData icon) {
    return Container(
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
            style: const TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: BrutalTheme.ink,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Arial',
              fontSize: 8,
              fontWeight: FontWeight.w700,
              color: BrutalTheme.disabled,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserRepos(BuildContext context, AsyncValue<List<Repository>> reposAsync, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'REPOSITORIES',
              style: TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.ink,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 2,
                color: BrutalTheme.ink,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        reposAsync.when(
          data: (repos) {
            if (repos.isEmpty) {
              return MangaContainer(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    'NO PUBLIC REPOSITORIES',
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
              children: repos.map((repo) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildRepoItem(context, repo, l10n),
              )).toList(),
            );
          },
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(color: BrutalTheme.ink),
            ),
          ),
          error: (error, stack) => Text(l10n.loadError.toUpperCase()),
        ),
      ],
    );
  }

  Widget _buildRepoItem(BuildContext context, Repository repo, AppLocalizations l10n) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RepositoryScreen(
              owner: repo.owner.login,
              repo: repo.name,
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
                const Icon(Icons.folder, size: 16, color: BrutalTheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    repo.name,
                    style: const TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: BrutalTheme.ink,
                    ),
                  ),
                ),
                if (repo.stargazersCount != null) ...[
                  const Icon(Icons.star, size: 14, color: BrutalTheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    '${repo.stargazersCount}',
                    style: const TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 12,
                      color: BrutalTheme.ink,
                    ),
                  ),
                ],
              ],
            ),
            if (repo.description != null) ...[
              const SizedBox(height: 8),
              Text(
                repo.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 12,
                  color: BrutalTheme.ink,
                  height: 1.4,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                if (repo.language != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: BrutalTheme.ink,
                      border: Border.all(color: BrutalTheme.ink, width: 1),
                    ),
                    child: Text(
                      repo.language!.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        color: BrutalTheme.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
