import 'package:flutter/material.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';

class AppTypo {
  static const _baseTypo = TextStyle(
    color: AppColors.typo,
  );

  static final v1 = _baseTypo.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final v2 = _baseTypo.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final v3 = _baseTypo.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final v4 = _baseTypo.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final v5 = _baseTypo.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final v6 = _baseTypo.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static final v7 = _baseTypo.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static final v8 = _baseTypo.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
