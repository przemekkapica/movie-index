import 'package:flutter/material.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';

const _dividerHeight = 0.75;

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.divider,
      height: _dividerHeight,
    );
  }
}
