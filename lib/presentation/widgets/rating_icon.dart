import 'package:flutter/material.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';
import 'package:movie_index/presentation/theme/app_dimens.dart';

class RatingIcon extends StatelessWidget {
  const RatingIcon({
    this.size = AppDimens.v16,
    super.key,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_rounded,
      size: size,
      color: AppColors.typo,
    );
  }
}
