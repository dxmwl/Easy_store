import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../models/platform_item.dart';
import 'manga_list_item.dart';

/// Manga风格平台选择弹窗
/// 
/// 使用 showModalBottomSheet 弹出底部选择菜单
/// 背景遮罩使用 Colors.black54 半透明黑色
class PlatformSelectorSheet {
  /// 弹出平台选择弹窗
  /// 
  /// 返回值：选中的 PlatformItem，用户点击遮罩关闭则返回 null
  static Future<PlatformItem?> show(
    BuildContext context, {
    PlatformItem? currentSelection,
  }) {
    return showModalBottomSheet<PlatformItem>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      isScrollControlled: true,
      builder: (context) => _PlatformSelectorContent(
        currentSelection: currentSelection,
      ),
    );
  }
}

/// 弹窗内容组件
class _PlatformSelectorContent extends StatefulWidget {
  final PlatformItem? currentSelection;

  const _PlatformSelectorContent({this.currentSelection});

  @override
  State<_PlatformSelectorContent> createState() => _PlatformSelectorContentState();
}

class _PlatformSelectorContentState extends State<_PlatformSelectorContent> {
  late PlatformItem _selected;

  @override
  void initState() {
    super.initState();
    // 默认选中 Android，如果传入了当前选择则使用它
    _selected = widget.currentSelection ??
        platformOptions.firstWhere((p) => p.id == 'android');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      // 底部弹窗的圆角顶部
      decoration: const BoxDecoration(
        color: BrutalTheme.canvas,
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
        border: Border(
          top: BorderSide(color: Colors.black, width: 3),
          left: BorderSide(color: Colors.black, width: 3),
          right: BorderSide(color: Colors.black, width: 3),
        ),
        // 硬阴影
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, -6),
            blurRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 标题栏：红色竖条装饰 + 标题文字
            _buildHeader(l10n),
            // 平台选项列表
            _buildPlatformList(l10n),
          ],
        ),
      ),
    );
  }

  /// 构建标题栏
  /// 左侧：红色竖条装饰 + "选择你的平台" 文字
  /// 右侧：灰色小字
  Widget _buildHeader(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          // 红色竖条装饰
          Container(
            width: 4,
            height: 24,
            color: BrutalTheme.primary,
          ),
          const SizedBox(width: 12),
          // 标题文字（多语言）
          Text(
            l10n.selectYourPlatform,
            style: BrutalTheme.headingStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }

  /// 构建平台选项列表
  /// 列表项之间垂直间距为 12dp，左右边距为 20dp
  Widget _buildPlatformList(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: platformOptions.map((platform) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: MangaListItem(
              icon: platform.icon,
              label: platform.getDisplayName(l10n),
              isSelected: _selected.id == platform.id,
              onTap: () {
                // 选中后自动关闭弹窗并返回选中值
                Navigator.of(context).pop(platform);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
