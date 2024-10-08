import 'package:auto_route/auto_route.dart';
import 'package:movie_index/presentation/routing/app_router.gr.dart';

class RoutesDefinitions {
  static final _movieDetailsRoute = AdaptiveRoute(
    page: MovieDetailsRoute.page,
  );

  static final _discoverTabRoute = AdaptiveRoute(
    page: DiscoverTabRouter.page,
    children: [
      AdaptiveRoute(
        page: DiscoverRoute.page,
        initial: true,
      ),
      _movieDetailsRoute,
    ],
  );

  static final _libraryTabRoute = AdaptiveRoute(
    page: LibraryTabRouter.page,
    children: [
      AdaptiveRoute(
        page: LibraryRoute.page,
        initial: true,
      ),
      _movieDetailsRoute,
    ],
  );

  static final List<AutoRoute> routes = [
    AdaptiveRoute(
      page: RouterSkeletonRoute.page,
      initial: true,
      children: [
        _discoverTabRoute,
        _libraryTabRoute,
      ],
    ),
  ];
}
