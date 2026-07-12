import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

/// Manga风格列表项组件
/// 
/// 实现原理：
/// 1. 硬阴影：使用 BoxShadow 的 blurRadius=0 来创建无模糊的实体阴影，
///    配合 offset 偏移量产生剪纸/贴纸的立体效果
/// 2. 按压动画：通过 GestureDetector 监听按下事件，
///    使用 Transform.translate 将卡片向阴影方向位移，
///    同时隐藏阴影，模拟物理按键被按下的触感
/// 3. 选中状态：背景色变为红色，文字/图标反转为白色
class MangaListItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const MangaListItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<MangaListItem> createState() => _MangaListItemState();
}

class _MangaListItemState extends State<MangaListItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // 硬阴影配置：blurRadius=0 是关键，确保阴影无模糊
    final shadow = _isPressed
        ? <BoxShadow>[]  // 按下时隐藏阴影
        : const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(6, 6),  // X/Y轴偏移量
              blurRadius: 0,         // 无模糊，产生硬边阴影
            ),
          ];

    // 按压时的位移：向阴影方向移动，模拟按下效果
    final offset = _isPressed ? const Offset(6, 6) : Offset.zero;

    // 颜色配置：选中状态反转颜色
    final bgColor = widget.isSelected ? BrutalTheme.primary : BrutalTheme.canvas;
    final fgColor = widget.isSelected ? BrutalTheme.white : BrutalTheme.ink;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: Transform.translate(
        offset: offset,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 60),
          curve: Curves.linear,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: shadow,
          ),
          child: Row(
            children: [
              // 平台图标
              Icon(widget.icon, size: 24, color: fgColor),
              const SizedBox(width: 16),
              // 平台名称
              Expanded(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: fgColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              // 选中状态显示对勾
              if (widget.isSelected)
                Icon(Icons.check, size: 24, color: fgColor),
            ],
          ),
        ),
      ),
    );
  }
}
