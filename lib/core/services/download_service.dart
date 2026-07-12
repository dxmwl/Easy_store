import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService {
  final Dio _dio;
  final Map<String, double> _progress = {};

  DownloadService() : _dio = Dio();

  Map<String, double> get progress => _progress;

  Future<String> getDownloadDirectory() async {
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      return directory?.path ?? '/storage/emulated/0/Download';
    } else if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    } else {
      final directory = await getDownloadsDirectory();
      return directory?.path ?? Platform.environment['HOME'] ?? '';
    }
  }

  Future<File> downloadFile({
    required String url,
    required String fileName,
    Function(double)? onProgress,
  }) async {
    final downloadDir = await getDownloadDirectory();
    final filePath = '$downloadDir/$fileName';

    await _dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total > 0) {
          final progress = received / total;
          _progress[url] = progress;
          onProgress?.call(progress);
        }
      },
    );

    _progress.remove(url);
    return File(filePath);
  }

  double getProgress(String url) {
    return _progress[url] ?? 0.0;
  }

  bool isDownloading(String url) {
    return _progress.containsKey(url);
  }
}
