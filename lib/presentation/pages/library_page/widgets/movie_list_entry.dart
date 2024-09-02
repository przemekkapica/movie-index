import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';
import 'package:movie_index/presentation/extensions/date_time_extension.dart';
import 'package:movie_index/presentation/routing/app_router.gr.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';
import 'package:movie_index/presentation/theme/app_dimens.dart';
import 'package:movie_index/presentation/theme/app_typo.dart';
import 'package:movie_index/presentation/widgets/rating_icon.dart';

const _posterHeight = 120.0;

class MovieListEntry extends StatelessWidget {
  const MovieListEntry({
    required this.movie,
    super.key,
  });

  final BaseMovie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(MovieDetailsRoute(movieId: movie.id));
      },
      child: SizedBox(
        height: _posterHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MoviePoster(movie: movie),
            const Gap(AppDimens.v16),
            _MovieBasicData(movie: movie),
          ],
        ),
      ),
    );
  }
}

class _MovieBasicData extends StatelessWidget {
  const _MovieBasicData({
    required this.movie,
  });

  final BaseMovie movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title, style: AppTypo.v2),
          const Gap(AppDimens.v8),
          Text(
            movie.releaseDate.formatYYYY,
            style: AppTypo.v8,
          ),
          const Spacer(),
          _RatingSection(movie: movie),
          const Gap(AppDimens.v4),
        ],
      ),
    );
  }
}

class _RatingSection extends StatelessWidget {
  const _RatingSection({
    required this.movie,
  });

  final BaseMovie movie;

  @override
  Widget build(BuildContext context) {
    final movieRating = movie.rating.toStringAsFixed(1);
    final voteCount = '(${movie.voteCount})';

    return Row(
      children: [
        const RatingIcon(),
        const Gap(AppDimens.v4),
        Text(
          movieRating,
          style: AppTypo.v4,
        ),
        const Gap(AppDimens.v2),
        Text(
          voteCount,
          style: AppTypo.v4.copyWith(color: AppColors.subtypo),
        ),
      ],
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    required this.movie,
  });

  final BaseMovie movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: movie.posterUrl,
      imageBuilder: (context, imageProvider) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.v4),
          ),
          child: Image(image: imageProvider),
        );
      },
      height: _posterHeight,
    );
  }
}
