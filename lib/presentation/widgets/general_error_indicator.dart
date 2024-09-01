import 'package:flutter/material.dart';
import 'package:movie_index/presentation/theme/app_typo.dart';

class GeneralErrorIndicator extends StatelessWidget {
  const GeneralErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Whoops, something went wrong :(',
        style: AppTypo.v5,
      ),
    );
  }
}
