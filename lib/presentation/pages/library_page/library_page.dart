import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:movie_index/presentation/pages/library_page/library_page_cubit.dart';
import 'package:movie_index/presentation/pages/library_page/library_page_state.dart';
import 'package:movie_index/presentation/pages/library_page/widgets/movie_list_entry.dart';

@RoutePage()
class LibraryPage extends HookWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<LibraryPageCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(
      () {
        cubit.init();
        return;
      },
      [],
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: state.map(
          loading: (_) => const _LoadingState(),
          error: (_) => const _ErrorState(),
          idle: (state) => _IdleState(
            cubit: cubit,
            state: state,
          ),
        ),
      ),
    );
  }
}

class _IdleState extends HookWidget {
  const _IdleState({
    required this.cubit,
    required this.state,
  });

  final LibraryPageCubit cubit;
  final LibraryPageStateIdle state;

  @override
  Widget build(BuildContext context) {
    final movies = state.movies;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels + 100 >
              notification.metrics.maxScrollExtent) {
            cubit.loadNextPage();
          }
          return false;
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return MovieListEntry(movie: movie);
                },
                separatorBuilder: (context, index) => const Column(
                  children: [Gap(4), Divider(), Gap(8)],
                ),
              ),
            ),
            if (state.isLoadingNextPage) ...[
              const CircularProgressIndicator(),
              const Gap(16),
            ],
          ],
        ),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ooops, something went wrong'),
    );
  }
}
