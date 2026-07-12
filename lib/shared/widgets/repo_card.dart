import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../config/theme.dart';
import '../../core/models/repository.dart';
import '../../features/repository/repository_screen.dart';

class RepoCard extends StatelessWidget {
  final Repository repository;

  const RepoCard({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    final parts = repository.fullName.split('/');
    final owner = parts.length > 1 ? parts[0] : repository.owner.login;
    final name = parts.length > 1 ? parts[1] : repository.name;

    return CupertinoListTile(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => RepositoryScreen(owner: owner, repo: name),
          ),
        );
      },
      leading: repository.owner.avatarUrl.isNotEmpty
          ? ClipOval(
              child: CachedNetworkImage(
                imageUrl: repository.owner.avatarUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            )
          : Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: CupertinoColors.systemGrey5,
                shape: BoxShape.circle,
              ),
              child: const Icon(CupertinoIcons.person, color: CupertinoColors.systemGrey),
            ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (repository.description != null)
            Text(
              repository.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
          const SizedBox(height: 4),
          Row(
            children: [
              if (repository.stargazersCount != null) ...[
                Icon(
                  CupertinoIcons.star_fill,
                  size: 14,
                  color: AppTheme.getStarColor(repository.stargazersCount!),
                ),
                const SizedBox(width: 4),
                Text(
                  AppTheme.formatNumber(repository.stargazersCount!),
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              if (repository.forksCount != null) ...[
                Icon(
                  CupertinoIcons.arrow_branch,
                  size: 14,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
                const SizedBox(width: 4),
                Text(
                  AppTheme.formatNumber(repository.forksCount!),
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              if (repository.language != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    repository.language!,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
      trailing: const CupertinoListTileChevron(),
    );
  }
}
