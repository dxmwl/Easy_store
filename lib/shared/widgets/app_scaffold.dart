import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            activeIcon: Icon(CupertinoIcons.home, color: CupertinoColors.systemBlue),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_down_circle),
            activeIcon: Icon(CupertinoIcons.arrow_down_circle, color: CupertinoColors.systemBlue),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            activeIcon: Icon(CupertinoIcons.book, color: CupertinoColors.systemBlue),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(CupertinoIcons.person, color: CupertinoColors.systemBlue),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/downloads');
              break;
            case 2:
              context.go('/library');
              break;
            case 3:
              context.go('/profile');
              break;
          }
        },
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) => child,
        );
      },
    );
  }
}
