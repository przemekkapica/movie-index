import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_index/presentation/routing/app_router.gr.dart';
import 'package:movie_index/presentation/routing/routes_definitions.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => RoutesDefinitions.routes;
}

@RoutePage()
class DiscoverTabRouter extends StatelessWidget {
  const DiscoverTabRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class LibraryTabRouter extends StatelessWidget {
  const LibraryTabRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
