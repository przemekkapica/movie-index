import 'package:flutter/material.dart';
import 'package:movie_index/app/app.dart';
import 'package:movie_index/core/di/di_config.dart';
import 'package:movie_index/presentation/routing/app_router.dart';

void main() {
  configureDependencies();

  runApp(
    App(appRouter: AppRouter()),
  );
}
