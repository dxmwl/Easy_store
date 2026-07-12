import 'package:flutter/material.dart';
import '../../config/brutal_theme.dart';

/// Manga风格横向分类Tab栏
/// 
/// 实现原理：
/// 1. 使用 SingleChildScrollView 实现横向滚动
/// 2. 硬阴影：blurRadius=0，offset(3,3) 产生剪纸效果
/// 3. 按压动画：Transform.translate 位移 + 隐藏阴影
/// 4. 选中状态：背景变红 + 白色文字
class MangaTabBar extends StatefulWidget {
  final List<String> categories;
  final int initialIndex;
  final ValueChanged<int> onCategoryChanged;

  const MangaTabBar({
    super.key,
    required this.categories,
    this.initialIndex = 0,
    required this.onCategoryChanged,
  });

  @override
  State<MangaTabBar> createState() => _MangaTabBarState();
}

class _MangaTabBarState extends State<MangaTabBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // 网点纹理背景装饰，增强漫画感
      decoration: BoxDecoration(
        color: BrutalTheme.canvas,
        border: Border(
          bottom: BorderSide(color: BrutalTheme.ink, width: 2),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // 隐藏滚动条
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: List.generate(widget.categories.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < widget.categories.length - 1 ? 10 : 0,
                ),
                child: MangaTabItem(
                  label: widget.categories[index],
                  isSelected: _selectedIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onCategoryChanged(index);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// Manga风格Tab项组件
/// 
/// 实现原理：
/// 1. 硬阴影：BoxShadow(blurRadius: 0) 确保无模糊
/// 2. 按压动画：通过 GestureDetector 监听按下事件
///    使用 Transform.translate 向阴影方向位移
///    同时隐藏阴影，模拟物理按键触感
/// 3. 选中状态：背景色变为红色，文字反转为白色
class MangaTabItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const MangaTabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<MangaTabItem> createState() => _MangaTabItemState();
}

class _MangaTabItemState extends State<MangaTabItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // 硬阴影配置：blurRadius=0 是关键
    final shadow = _isPressed
        ? <BoxShadow>[]  // 按下时隐藏阴影
        : const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
              blurRadius: 0,  // 无模糊，产生硬边阴影
            ),
          ];

    // 按压时的位移：向阴影方向移动
    final offset = _isPressed ? const Offset(3, 3) : Offset.zero;

    // 颜色配置
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: Colors.black, width: 2.5),
            boxShadow: shadow,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: fgColor,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
