import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

/// 平台选项数据类
/// 管理每个平台选项的图标、名称和唯一ID
/// 仅 "all" 需要多语言适配，其他平台保持原名
class PlatformItem {
  final String id;
  final String name;
  final IconData icon;

  const PlatformItem({
    required this.id,
    required this.name,
    required this.icon,
  });

  /// 获取显示名称
  /// "all" 根据语言显示，其他保持原名
  String getDisplayName(AppLocalizations l10n) {
    if (id == 'all') return l10n.all;
    return name;
  }
}

/// 预定义的平台选项列表
const List<PlatformItem> platformOptions = [
  PlatformItem(id: 'all', name: 'ALL', icon: Icons.apps),
  PlatformItem(id: 'android', name: 'ANDROID', icon: Icons.android),
  PlatformItem(id: 'macos', name: 'macOS', icon: Icons.apple),
  PlatformItem(id: 'windows', name: 'Windows', icon: Icons.desktop_windows),
  PlatformItem(id: 'linux', name: 'Linux', icon: Icons.computer),
  PlatformItem(id: 'ios', name: 'iOS', icon: Icons.phone_iphone),
];
