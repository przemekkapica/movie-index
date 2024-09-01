import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:movie_index/presentation/pages/discover_page/discover_page_cubit.dart';
import 'package:movie_index/presentation/pages/discover_page/discover_page_state.dart';

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
      },
      [cubit],
    );

    return Scaffold(
      body: state.map(
        loading: (_) => const _LoadingState(),
        error: (_) => const _ErrorState(),
        idle: (state) => _IdleState(state: state),
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
    return const Placeholder();
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
