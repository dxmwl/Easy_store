import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// 下载记录
class DownloadRecord {
  final String id;
  final String url;
  final String fileName;
  final String repoName;
  final String repoOwner;
  final DateTime createdAt;
  double progress;
  double speed;
  bool isCompleted;
  bool isFailed;
  String? filePath;
  String? errorMessage;
  int totalBytes;
  int receivedBytes;

  DownloadRecord({
    required this.id,
    required this.url,
    required this.fileName,
    required this.repoName,
    required this.repoOwner,
    DateTime? createdAt,
    this.progress = 0.0,
    this.speed = 0.0,
    this.isCompleted = false,
    this.isFailed = false,
    this.filePath,
    this.errorMessage,
    this.totalBytes = 0,
    this.receivedBytes = 0,
  }) : createdAt = createdAt ?? DateTime.now();
}

class DownloadService {
  final Dio _dio;
  final Map<String, DownloadRecord> _records = {};
  final Map<String, CancelToken> _cancelTokens = {};
  final StreamController<List<DownloadRecord>> _recordsController = 
      StreamController<List<DownloadRecord>>.broadcast();
  String _downloadDirectory = '';

  DownloadService() : _dio = Dio();

  Stream<List<DownloadRecord>> get recordsStream => _recordsController.stream;

  List<DownloadRecord> get records => _records.values.toList()
    ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  Future<String> getDownloadDirectory() async {
    if (_downloadDirectory.isNotEmpty) return _downloadDirectory;
    
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      _downloadDirectory = directory?.path ?? '/storage/emulated/0/Download';
    } else if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      _downloadDirectory = directory.path;
    } else {
      final directory = await getDownloadsDirectory();
      _downloadDirectory = directory?.path ?? Platform.environment['HOME'] ?? '';
    }
    return _downloadDirectory;
  }

  /// 设置下载目录
  Future<void> setDownloadDirectory(String path) async {
    _downloadDirectory = path;
  }

  /// 获取当前下载目录
  String get currentDownloadDirectory => _downloadDirectory;

  /// 下载文件
  Future<File?> download({
    required String url,
    required String fileName,
    required String repoName,
    required String repoOwner,
    Function(double)? onProgress,
    Function(double)? onSpeed,
    Function(String)? onComplete,
    Function(String)? onError,
  }) async {
    final recordId = '${repoOwner}_${repoName}_$fileName';
    
    // 创建下载记录
    final record = DownloadRecord(
      id: recordId,
      url: url,
      fileName: fileName,
      repoName: repoName,
      repoOwner: repoOwner,
    );
    _records[recordId] = record;
    _notifyListeners();

    try {
      final downloadDir = await getDownloadDirectory();
      final filePath = '$downloadDir/$fileName';
      
      // 创建 CancelToken
      final cancelToken = CancelToken();
      _cancelTokens[recordId] = cancelToken;

      // 记录下载开始时间
      final startTime = DateTime.now();
      int lastReceived = 0;
      DateTime lastTime = startTime;

      await _dio.download(
        url,
        filePath,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            final progress = received / total;
            record.progress = progress;
            record.totalBytes = total;
            record.receivedBytes = received;
            
            // 计算下载速度
            final currentTime = DateTime.now();
            final timeDiff = currentTime.difference(lastTime).inMilliseconds;
            if (timeDiff > 0) {
              final bytesDiff = received - lastReceived;
              record.speed = bytesDiff / timeDiff * 1000; // bytes per second
              lastReceived = received;
              lastTime = currentTime;
            }
            
            onProgress?.call(progress);
            onSpeed?.call(record.speed);
            _notifyListeners();
          }
        },
      );

      // 下载完成
      record.progress = 1.0;
      record.speed = 0.0;
      record.isCompleted = true;
      record.filePath = filePath;
      _cancelTokens.remove(recordId);
      _notifyListeners();

      onComplete?.call(filePath);
      return File(filePath);
    } catch (e) {
      record.isFailed = true;
      record.errorMessage = e.toString();
      record.speed = 0.0;
      _cancelTokens.remove(recordId);
      _notifyListeners();
      
      onError?.call(e.toString());
      return null;
    }
  }

  void _notifyListeners() {
    _recordsController.add(records);
  }

  /// 取消下载
  void cancelDownload(String recordId) {
    final cancelToken = _cancelTokens[recordId];
    if (cancelToken != null && !cancelToken.isCancelled) {
      cancelToken.cancel('用户取消下载');
    }
    _records.remove(recordId);
    _cancelTokens.remove(recordId);
    _notifyListeners();
  }

  /// 删除记录
  void removeRecord(String recordId) {
    _records.remove(recordId);
    _notifyListeners();
  }

  /// 清空所有记录
  void clearRecords() {
    _records.clear();
    _notifyListeners();
  }

  /// 打开已下载的文件
  Future<void> openFile(String filePath) async {
    try {
      final url = Uri.file(filePath);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('无法打开文件: $e');
    }
  }

  /// 获取文件大小格式化字符串
  static String formatFileSize(int bytes) {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else if (bytes >= 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '$bytes B';
  }

  /// 格式化下载速度
  static String formatSpeed(double bytesPerSecond) {
    if (bytesPerSecond >= 1024 * 1024) {
      return '${(bytesPerSecond / (1024 * 1024)).toStringAsFixed(1)} MB/s';
    } else if (bytesPerSecond >= 1024) {
      return '${(bytesPerSecond / 1024).toStringAsFixed(1)} KB/s';
    }
    return '${bytesPerSecond.toStringAsFixed(0)} B/s';
  }
}
