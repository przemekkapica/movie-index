import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_index/presentation/routing/app_router.gr.dart';
import 'package:movie_index/presentation/widgets/bottom_nav_bar.dart';

const _tabsRoutes = [
  DiscoverTabRouter(),
  LibraryTabRouter(),
];

@RoutePage()
class RouterSkeletonPage extends StatelessWidget {
  const RouterSkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      homeIndex: 0,
      physics: const NeverScrollableScrollPhysics(),
      routes: _tabsRoutes,
      builder: (context, child, controller) {
        return Column(
          children: [
            Expanded(child: child),
            const BottomNavBar(),
          ],
        );
      },
    );
  }
}
