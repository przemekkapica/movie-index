import 'package:flutter/material.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}
