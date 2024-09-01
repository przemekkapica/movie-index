import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:movie_index/domain/base_index/models/movie_details.dart';
import 'package:movie_index/presentation/extensions/date_time_extension.dart';
import 'package:movie_index/presentation/extensions/duration_extension.dart';
import 'package:movie_index/presentation/pages/movie_details_page/movie_details_page_cubit.dart';
import 'package:movie_index/presentation/pages/movie_details_page/movie_details_page_state.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';
import 'package:movie_index/presentation/theme/app_dimens.dart';
import 'package:movie_index/presentation/theme/app_typo.dart';
import 'package:movie_index/presentation/widgets/app_divider.dart';
import 'package:movie_index/presentation/widgets/general_error_indicator.dart';
import 'package:movie_index/presentation/widgets/loading_indicator.dart';

@RoutePage()
class MovieDetailsPage extends HookWidget {
  const MovieDetailsPage({
    required this.movieId,
    super.key,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<MovieDetailsPageCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(
      () {
        cubit.init(movieId: movieId);
        return;
      },
      [],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: AppDimens.v32,
            color: AppColors.typo,
          ),
          onPressed: context.router.maybePop,
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: state.map(
          loading: (_) => const LoadingIndicator(),
          error: (_) => const GeneralErrorIndicator(),
          idle: (state) => _IdleState(
            state: state,
          ),
        ),
      ),
    );
  }
}

class _IdleState extends HookWidget {
  const _IdleState({
    required this.state,
  });

  final MovieDetailsPageStateIdle state;

  @override
  Widget build(BuildContext context) {
    final details = state.movieDetails;

    return Stack(
      children: [
        _GradientOnPosterBackground(posterUrl: details.posterUrl),
        _DetailsMainContent(
          details: state.movieDetails,
        ),
      ],
    );
  }
}

class _DetailsMainContent extends StatelessWidget {
  const _DetailsMainContent({
    required this.details,
  });

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    final singleInfoSections = [
      if (details.directorName != null) ('Director', details.directorName!),
      ('Production', details.productionCountries.join(', ')),
      ('Distributor', details.distributors.join(', ')),
      ('Release Date', details.releaseDate.formatYYYY),
      ('Original Language', details.originalLanguage),
      ('Budget', '\$${details.budget}'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.v16).copyWith(
        top: MediaQuery.sizeOf(context).height * 0.47,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(details.title, style: AppTypo.v1),
            const Gap(AppDimens.v8),
            _BaseInfoSection(details: details),
            const Gap(AppDimens.v16),
            _RatingSection(details: details),
            const Gap(AppDimens.v16),
            Text(details.description.trim(), style: AppTypo.v6),
            const Gap(AppDimens.v48),
            _DetailedInfoSection(singleInfoSections: singleInfoSections),
            const Gap(AppDimens.v16),
          ],
        ),
      ),
    );
  }
}

class _DetailedInfoSection extends StatelessWidget {
  const _DetailedInfoSection({
    required this.singleInfoSections,
  });

  final List<(String, String)> singleInfoSections;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = singleInfoSections[index];

        return _SingleInfoSection(
          title: item.$1,
          value: item.$2,
        );
      },
      separatorBuilder: (context, index) => const Column(
        children: [Gap(AppDimens.v8), AppDivider(), Gap(AppDimens.v8)],
      ),
      itemCount: singleInfoSections.length,
    );
  }
}

class _RatingSection extends StatelessWidget {
  const _RatingSection({
    required this.details,
  });

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.v4),
        color: AppColors.tag,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.v8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_rate_rounded,
              color: AppColors.typo,
            ),
            const Gap(AppDimens.v4),
            Text(
              details.rating.toStringAsFixed(1),
              style: AppTypo.v2,
            ),
            const Gap(AppDimens.v2),
            Text(
              '(${details.voteCount})',
              style: AppTypo.v4.copyWith(color: AppColors.subtypo),
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseInfoSection extends StatelessWidget {
  const _BaseInfoSection({
    required this.details,
  });

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    final typo = AppTypo.v8.copyWith(color: AppColors.subtypo);

    return Row(
      children: [
        Text(details.releaseDate.formatYYYY, style: typo),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.v8),
          child: Text('|', style: typo),
        ),
        Text(details.runtime.formatHHmm, style: typo),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.v8),
          child: Text('|', style: typo),
        ),
        Text(
          details.genres
              .sublist(0, min(details.genres.length, 3))
              .map((genre) => genre.name)
              .toList()
              .join(', '),
          style: typo,
        ),
      ],
    );
  }
}

class _GradientOnPosterBackground extends StatelessWidget {
  const _GradientOnPosterBackground({
    required this.posterUrl,
  });

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: posterUrl,
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, AppColors.background],
              stops: [0, .5],
            ),
          ),
        ),
      ],
    );
  }
}

class _SingleInfoSection extends StatelessWidget {
  const _SingleInfoSection({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypo.v8),
        const Gap(AppDimens.v8),
        Text(
          value,
          style: AppTypo.v5.copyWith(color: AppColors.subtypo),
        ),
      ],
    );
  }
}
