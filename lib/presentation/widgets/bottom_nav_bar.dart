import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavBar extends HookWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final tabsRouter = context.tabsRouter;

    return BottomNavigationBar(
      currentIndex: currentIndex.value,
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
        currentIndex.value = index;
      },
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books_outlined),
          activeIcon: Icon(Icons.library_books_rounded),
          label: 'Library',
        ),
      ],
    );
  }
}
