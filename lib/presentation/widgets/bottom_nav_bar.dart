import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';
import 'package:movie_index/presentation/theme/app_typo.dart';

class BottomNavBar extends HookWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final tabsRouter = context.tabsRouter;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.divider, width: 0.5),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColors.bottomNavBar,
        currentIndex: currentIndex.value,
        onTap: (index) {
          tabsRouter.setActiveIndex(index);
          currentIndex.value = index;
        },
        showUnselectedLabels: true,
        selectedLabelStyle: AppTypo.v5,
        unselectedLabelStyle: AppTypo.v5,
        selectedItemColor: AppColors.typo,
        unselectedItemColor: AppColors.subtypo,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              color: AppColors.subtypo,
            ),
            activeIcon: Icon(
              Icons.explore,
              color: AppColors.typo,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books_outlined,
              color: AppColors.subtypo,
            ),
            activeIcon: Icon(
              Icons.library_books_rounded,
              color: AppColors.typo,
            ),
            backgroundColor: AppColors.typo,
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
