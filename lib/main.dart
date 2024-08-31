import 'package:flutter/material.dart';
import 'package:movie_index/app/app.dart';
import 'package:movie_index/presentation/routing/app_router.dart';

void main() {
  runApp(
    App(appRouter: AppRouter()),
  );
}
