import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:movie_index/presentation/pages/discover_page/discover_page_cubit.dart';
import 'package:movie_index/presentation/pages/discover_page/discover_page_state.dart';
import 'package:movie_index/presentation/pages/discover_page/widgets/collection_carousel_section.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';
import 'package:movie_index/presentation/theme/app_dimens.dart';
import 'package:movie_index/presentation/widgets/general_error_indicator.dart';
import 'package:movie_index/presentation/widgets/loading_indicator.dart';

@RoutePage()
class DiscoverPage extends HookWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<DiscoverPageCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(
      () {
        cubit.init();
        return;
      },
      [cubit],
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: state.map(
          loading: (_) => const LoadingIndicator(),
          error: (_) => const GeneralErrorIndicator(),
          idle: (state) => _IdleState(state: state),
        ),
      ),
    );
  }
}

class _IdleState extends StatelessWidget {
  const _IdleState({
    required this.state,
  });
  final DiscoverPageStateIdle state;

  @override
  Widget build(BuildContext context) {
    final featuredCollectionsData = [
      CollectionData(title: 'Popular', collection: state.popularMovies),
      CollectionData(title: 'Now playing', collection: state.nowPlayingMovies),
      CollectionData(title: 'Top rated', collection: state.topRatedMovies),
      CollectionData(title: 'Upcoming', collection: state.upcomingMovies),
    ];

    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.v16),
      child: ListView.separated(
        itemCount: featuredCollectionsData.length,
        itemBuilder: (context, index) {
          final collectionData = featuredCollectionsData[index];

          return CollectionCarouselSection(
            collectionData: collectionData,
          );
        },
        separatorBuilder: (context, index) => const Gap(AppDimens.v32),
      ),
    );
  }
}
