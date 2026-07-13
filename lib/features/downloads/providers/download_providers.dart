import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/download_service.dart';

/// 下载状态管理
class DownloadNotifier extends StateNotifier<List<DownloadRecord>> {
  final DownloadService _service;
  StreamSubscription? _subscription;

  DownloadNotifier(this._service) : super([]) {
    // 监听下载记录变化
    _subscription = _service.recordsStream.listen((records) {
      state = records;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  List<DownloadRecord> get records => _service.records;

  /// 开始下载
  Future<void> startDownload({
    required String url,
    required String fileName,
    required String repoName,
    required String repoOwner,
  }) async {
    await _service.download(
      url: url,
      fileName: fileName,
      repoName: repoName,
      repoOwner: repoOwner,
    );
  }

  /// 取消下载
  void cancelDownload(String recordId) {
    _service.cancelDownload(recordId);
  }

  /// 删除记录
  void removeRecord(String recordId) {
    _service.removeRecord(recordId);
  }

  /// 清空记录
  void clearRecords() {
    _service.clearRecords();
  }
}

final downloadServiceProvider = Provider<DownloadService>((ref) {
  return DownloadService();
});

final downloadNotifierProvider = StateNotifierProvider<DownloadNotifier, List<DownloadRecord>>((ref) {
  final service = ref.watch(downloadServiceProvider);
  return DownloadNotifier(service);
});
