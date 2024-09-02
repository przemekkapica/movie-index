import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:movie_index/core/di/di_config.dart';
import 'package:movie_index/presentation/routing/app_router.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';

class App extends StatelessWidget {
  const App({
    required this.appRouter,
    super.key,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return HookedBlocConfigProvider(
      injector: () => getIt.call,
      child: MaterialApp.router(
        theme: _getThemeData(),
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }

  ThemeData _getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.typo),
      fontFamily: 'Montserrat',
      useMaterial3: true,
    );
  }
}
