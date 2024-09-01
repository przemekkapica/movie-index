import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';

part 'library_page_state.freezed.dart';

@freezed
abstract class LibraryPageState with _$LibraryPageState {
  const factory LibraryPageState.loading() = _LibraryPageStateLoading;

  const factory LibraryPageState.error() = _LibraryPageStateError;

  const factory LibraryPageState.idle({
    required List<BaseMovie> movies,
    required int currentPage,
    required bool isLoadingNextPage,
  }) = LibraryPageStateIdle;
}

extension LibraryPageStateExtension on LibraryPageState {
  int? get currentPage {
    return map(
      loading: (_) => null,
      error: (_) => null,
      idle: (idle) => idle.currentPage,
    );
  }

  List<BaseMovie>? get movies {
    return map(
      loading: (_) => null,
      error: (_) => null,
      idle: (idle) => idle.movies,
    );
  }

  LibraryPageState copyWith({
    List<BaseMovie>? movies,
    int? currentPage,
    bool? isLoadingNextPage,
  }) {
    return map(
      loading: (_) => this,
      error: (_) => this,
      idle: (idle) => idle.copyWith(
        movies: movies ?? idle.movies,
        currentPage: currentPage ?? idle.currentPage,
        isLoadingNextPage: isLoadingNextPage ?? idle.isLoadingNextPage,
      ),
    );
  }
}
