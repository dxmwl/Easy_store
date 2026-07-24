import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../l10n/app_localizations.dart';
import '../../../config/brutal_theme.dart';
import '../../../shared/widgets/brutal_widgets.dart';
import '../../../core/services/download_service.dart';
import 'providers/download_providers.dart';

class DownloadsScreen extends ConsumerStatefulWidget {
  const DownloadsScreen({super.key});

  @override
  ConsumerState<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends ConsumerState<DownloadsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final downloadService = ref.watch(downloadServiceProvider);
    final records = ref.watch(downloadNotifierProvider);

    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(l10n, records, ref, downloadService),
            Expanded(
              child: records.isEmpty
                  ? _buildEmptyState(l10n)
                  : _buildRecordsList(records, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(AppLocalizations l10n, List<DownloadRecord> records, WidgetRef ref, DownloadService downloadService) {
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
          // 返回按钮
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
          const Icon(Icons.download, size: 24),
          const SizedBox(width: 8),
          Text(
            l10n.downloads.toUpperCase(),
            style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
          ),
          const Spacer(),
          // 设置下载位置按钮
          GestureDetector(
            onTap: () => _showDownloadLocationDialog(context, downloadService),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: BrutalTheme.surface,
                border: Border.all(color: BrutalTheme.ink, width: 1.5),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.folder_open, size: 14, color: BrutalTheme.ink),
                  SizedBox(width: 4),
                  Text(
                    'LOCATION',
                    style: TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: BrutalTheme.ink,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (records.isNotEmpty) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                ref.read(downloadServiceProvider).clearRecords();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: BrutalTheme.primary,
                  border: Border.all(color: BrutalTheme.ink, width: 1.5),
                ),
                child: const Text(
                  'CLEAR',
                  style: TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: BrutalTheme.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// 显示下载位置设置弹窗
  void _showDownloadLocationDialog(BuildContext context, DownloadService downloadService) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: BrutalTheme.canvas,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: BrutalTheme.ink, width: 2),
        ),
        title: const Text(
          'DOWNLOAD LOCATION',
          style: TextStyle(
            fontFamily: 'Arial Black',
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current location:',
              style: BrutalTheme.metaStyle.copyWith(fontSize: 11),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: BrutalTheme.surface,
                border: Border.all(color: BrutalTheme.ink, width: 1),
              ),
              child: Text(
                downloadService.currentDownloadDirectory,
                style: BrutalTheme.bodyStyle.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () async {
              // 这里可以添加文件夹选择器
              // 目前使用默认位置
              Navigator.pop(context);
            },
            child: const Text('CHANGE'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: BrutalCard(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: BrutalTheme.surface,
                border: Border.all(color: BrutalTheme.ink, width: 2),
              ),
              child: const Icon(
                Icons.download_done,
                size: 48,
                color: BrutalTheme.ink,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noDownloads.toUpperCase(),
              style: BrutalTheme.subheadingStyle,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.downloadedFilesWillAppear.toUpperCase(),
              style: BrutalTheme.bodyStyle.copyWith(
                color: BrutalTheme.disabled,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordsList(List<DownloadRecord> records, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildRecordItem(record, ref),
        );
      },
    );
  }

  Widget _buildRecordItem(DownloadRecord record, WidgetRef ref) {
    return BrutalCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题行
          Row(
            children: [
              Icon(
                record.isCompleted
                    ? Icons.check_circle
                    : record.isFailed
                        ? Icons.error
                        : Icons.downloading,
                size: 20,
                color: record.isCompleted
                    ? const Color(0xFF3DDC84)
                    : record.isFailed
                        ? BrutalTheme.primary
                        : BrutalTheme.ink,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.fileName,
                      style: BrutalTheme.subheadingStyle.copyWith(fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${record.repoOwner}/${record.repoName}',
                      style: BrutalTheme.metaStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
              // 删除按钮
              GestureDetector(
                onTap: () {
                  ref.read(downloadServiceProvider).removeRecord(record.id);
                },
                child: const Icon(
                  Icons.delete_outline,
                  size: 18,
                  color: BrutalTheme.disabled,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 进度条和速度
          if (!record.isCompleted && !record.isFailed) ...[
            // 下载中
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: LinearProgressIndicator(
                      value: record.progress,
                      backgroundColor: BrutalTheme.surface,
                      valueColor: AlwaysStoppedAnimation<Color>(BrutalTheme.primary),
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${(record.progress * 100).toStringAsFixed(1)}%',
                  style: BrutalTheme.metaStyle.copyWith(fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // 下载速度
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DownloadService.formatSpeed(record.speed),
                  style: BrutalTheme.metaStyle.copyWith(
                    fontSize: 10,
                    color: BrutalTheme.primary,
                  ),
                ),
                // 取消按钮
                GestureDetector(
                  onTap: () {
                    ref.read(downloadServiceProvider).cancelDownload(record.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: BrutalTheme.surface,
                      border: Border.all(color: BrutalTheme.ink, width: 1),
                    ),
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        color: BrutalTheme.ink,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ] else if (record.isFailed) ...[
            // 下载失败
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: BrutalTheme.primary.withValues(alpha: 0.1),
                border: Border.all(color: BrutalTheme.primary, width: 1),
              ),
              child: Text(
                record.errorMessage ?? 'Download failed',
                style: BrutalTheme.metaStyle.copyWith(
                  fontSize: 10,
                  color: BrutalTheme.primary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ] else ...[
            // 下载完成
            Row(
              children: [
                const Icon(Icons.check_circle, size: 14, color: Color(0xFF3DDC84)),
                const SizedBox(width: 4),
                Text(
                  'COMPLETED',
                  style: BrutalTheme.labelStyle.copyWith(
                    color: const Color(0xFF3DDC84),
                    fontSize: 9,
                  ),
                ),
                const Spacer(),
                // 打开文件按钮
                GestureDetector(
                  onTap: () {
                    if (record.filePath != null) {
                      ref.read(downloadServiceProvider).openFile(record.filePath!);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: BrutalTheme.primary,
                      border: Border.all(color: BrutalTheme.ink, width: 1.5),
                    ),
                    child: const Text(
                      'OPEN',
                      style: TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        color: BrutalTheme.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          // 时间戳
          const SizedBox(height: 4),
          Text(
            DateFormat('yyyy-MM-dd HH:mm').format(record.createdAt),
            style: BrutalTheme.metaStyle.copyWith(fontSize: 9),
          ),
        ],
      ),
    );
  }
}
