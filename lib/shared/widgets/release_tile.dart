import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../core/models/release.dart';

class ReleaseTile extends StatelessWidget {
  final Release release;
  final VoidCallback? onDownload;

  const ReleaseTile({
    super.key,
    required this.release,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: Icon(
        release.prerelease == true
            ? CupertinoIcons.exclamationmark_triangle
            : CupertinoIcons.checkmark_circle,
        color: release.prerelease == true
            ? CupertinoColors.systemOrange
            : CupertinoColors.systemGreen,
      ),
      title: Text(
        release.name ?? release.tagName,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (release.body != null && release.body!.isNotEmpty)
            Text(
              release.body!,
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
              if (release.publishedAt != null)
                Text(
                  DateFormat('MMM d, yyyy').format(release.publishedAt!),
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
              if (release.assets != null && release.assets!.isNotEmpty) ...[
                const SizedBox(width: 12),
                Text(
                  '${release.assets!.length} assets',
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
      trailing: onDownload != null
          ? CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onDownload,
              child: const Icon(CupertinoIcons.down_arrow),
            )
          : null,
    );
  }
}
