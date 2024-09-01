import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_index/domain/featured_collections/featured_collections_repository.dart';
import 'package:movie_index/domain/featured_collections/models/featured_movie.dart';
import 'package:movie_index/presentation/pages/discover_page/discover_page_cubit.dart';
import 'package:movie_index/presentation/pages/discover_page/discover_page_state.dart';

class MockFeaturedCollectionsRepository extends Mock
    implements FeaturedCollectionsRepository {}

class MockFeaturedMovie extends Mock implements FeaturedMovie {}

void main() {
  group('DiscoverPageCubit', () {
    late MockFeaturedCollectionsRepository repository;
    late DiscoverPageCubit cubit;

    final featuredCollection = [
      MockFeaturedMovie(),
      MockFeaturedMovie(),
      MockFeaturedMovie(),
    ];

    setUp(() {
      repository = MockFeaturedCollectionsRepository();
      cubit = DiscoverPageCubit(repository);
    });

    test('initial state is loading', () {
      expect(cubit.state, const DiscoverPageState.loading());
    });

    blocTest<DiscoverPageCubit, DiscoverPageState>(
      'emits idle state when receives data',
      build: () => cubit,
      setUp: () {
        when(() => repository.getNowPlayingMovies())
            .thenAnswer((_) async => featuredCollection);
        when(() => repository.getPopularMovies())
            .thenAnswer((_) async => featuredCollection);
        when(() => repository.getTopRatedMovies())
            .thenAnswer((_) async => featuredCollection);
        when(() => repository.getUpcomingMovies())
            .thenAnswer((_) async => featuredCollection);
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        DiscoverPageState.idle(
          popularMovies: featuredCollection,
          topRatedMovies: featuredCollection,
          nowPlayingMovies: featuredCollection,
          upcomingMovies: featuredCollection,
        ),
      ],
    );

    blocTest<DiscoverPageCubit, DiscoverPageState>(
      'emits error state when could not get data',
      build: () => cubit,
      setUp: () {
        when(() => repository.getNowPlayingMovies())
            .thenAnswer((_) async => featuredCollection);
        when(() => repository.getPopularMovies()).thenThrow(Exception());
        when(() => repository.getTopRatedMovies()).thenAnswer((_) async => []);
        when(() => repository.getUpcomingMovies()).thenAnswer((_) async => []);
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const DiscoverPageState.error(),
      ],
    );
  });
}
