import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/domain/base_index/base_index_repository.dart';
import 'package:movie_index/presentation/pages/library_page/library_page_state.dart';

@Injectable()
class LibraryPageCubit extends Cubit<LibraryPageState> {
  LibraryPageCubit(
    this._indexRepository,
  ) : super(const LibraryPageState.loading());

  final BaseIndexRepository _indexRepository;

  Future<void> init() async {
    try {
      final movies = await _indexRepository.getMovies();

      emit(
        LibraryPageState.idle(
          movies: movies,
          currentPage: 1,
          isLoadingNextPage: false,
        ),
      );
    } catch (_) {
      emit(const LibraryPageState.error());
    }
  }

  Future<void> loadNextPage() async {
    try {
      if (state.currentPage == null) return;

      final nextPage = state.currentPage! + 1;
      emit(state.copyWith(isLoadingNextPage: true));

      final nextPageMovies = await _indexRepository.getMovies(page: nextPage);
      final loadedMovies = state.movies ?? [];
      final combinedMovies = [...loadedMovies, ...nextPageMovies];

      emit(
        LibraryPageState.idle(
          movies: combinedMovies,
          currentPage: nextPage,
          isLoadingNextPage: false,
        ),
      );
    } catch (_) {
      emit(const LibraryPageState.error());
    }
  }
}
