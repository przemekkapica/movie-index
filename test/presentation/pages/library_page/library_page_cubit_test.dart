import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_index/domain/base_index/base_index_repository.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';
import 'package:movie_index/presentation/pages/library_page/library_page_cubit.dart';
import 'package:movie_index/presentation/pages/library_page/library_page_state.dart';

class MockBaseIndexRepository extends Mock implements BaseIndexRepository {}

class MockBaseMovie extends Mock implements BaseMovie {}

void main() {
  group('LibraryPageCubit', () {
    late MockBaseIndexRepository repository;
    late LibraryPageCubit cubit;

    final firstPageMovies = [MockBaseMovie(), MockBaseMovie()];
    final secondPageMovies = [
      MockBaseMovie(),
      MockBaseMovie(),
      MockBaseMovie(),
    ];

    setUp(() {
      repository = MockBaseIndexRepository();
      cubit = LibraryPageCubit(repository);
    });

    test('initial state is loading', () {
      expect(cubit.state, const LibraryPageState.loading());
    });

    blocTest<LibraryPageCubit, LibraryPageState>(
      'emits idle state on init when receives data',
      build: () => cubit,
      setUp: () {
        when(repository.getMovies).thenAnswer((_) async => firstPageMovies);
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        LibraryPageState.idle(
          movies: firstPageMovies,
          currentPage: 1,
          isLoadingNextPage: false,
        ),
      ],
      verify: (cubit) {
        verify(repository.getMovies).called(1);
        verifyNoMoreInteractions(repository);
      },
    );

    blocTest<LibraryPageCubit, LibraryPageState>(
      'emits idle state when loaded next page',
      build: () => cubit,
      setUp: () {
        when(repository.getMovies).thenAnswer((_) async => firstPageMovies);
        when(() => repository.getMovies(page: 2))
            .thenAnswer((_) async => secondPageMovies);
      },
      act: (cubit) async {
        await cubit.init();
        await cubit.loadNextPage();
      },
      expect: () => [
        LibraryPageState.idle(
          movies: firstPageMovies,
          currentPage: 1,
          isLoadingNextPage: false,
        ),
        LibraryPageState.idle(
          movies: firstPageMovies,
          currentPage: 1,
          isLoadingNextPage: true,
        ),
        LibraryPageState.idle(
          movies: [...firstPageMovies, ...secondPageMovies],
          currentPage: 2,
          isLoadingNextPage: false,
        ),
      ],
      verify: (cubit) {
        verify(repository.getMovies).called(1);
        verify(() => repository.getMovies(page: 2)).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
