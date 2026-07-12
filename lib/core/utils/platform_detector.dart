/// 根据仓库信息检测支持的平台
/// 通过 topics、language、name 等字段推断
class PlatformDetector {
  /// 检测仓库支持的平台列表
  static List<String> detectPlatforms({
    List<String>? topics,
    String? language,
    String? name,
    String? description,
  }) {
    final platforms = <String>{};
    final allText = [
      ...?topics,
      language ?? '',
      name ?? '',
      description ?? '',
    ].join(' ').toLowerCase();

    // Android 检测
    if (allText.contains('android') ||
        allText.contains('apk') ||
        allText.contains('mobile') ||
        allText.contains('flutter') ||
        allText.contains('kotlin') ||
        allText.contains('java')) {
      platforms.add('android');
    }

    // iOS 检测
    if (allText.contains('ios') ||
        allText.contains('iphone') ||
        allText.contains('ipad') ||
        allText.contains('swift') ||
        allText.contains('swiftui')) {
      platforms.add('ios');
    }

    // macOS 检测
    if (allText.contains('macos') ||
        allText.contains('mac') ||
        allText.contains('cocoa') ||
        (allText.contains('swift') && !allText.contains('android'))) {
      platforms.add('macos');
    }

    // Windows 检测
    if (allText.contains('windows') ||
        allText.contains('win32') ||
        allText.contains('.net') ||
        allText.contains('c#') ||
        allText.contains('electron')) {
      platforms.add('windows');
    }

    // Linux 检测
    if (allText.contains('linux') ||
        allText.contains('gtk') ||
        allText.contains('qt') ||
        allText.contains('deb') ||
        allText.contains('appimage')) {
      platforms.add('linux');
    }

    // 如果没有检测到任何平台，尝试从语言推断
    if (platforms.isEmpty) {
      if (language != null) {
        final lang = language.toLowerCase();
        if (['kotlin', 'java', 'dart'].contains(lang)) {
          platforms.add('android');
        }
        if (['swift', 'objective-c'].contains(lang)) {
          platforms.add('ios');
          platforms.add('macos');
        }
        if (['c#', 'c++'].contains(lang)) {
          platforms.add('windows');
        }
        if (['c', 'rust', 'go'].contains(lang)) {
          platforms.add('linux');
        }
      }
    }

    return platforms.toList();
  }
}
