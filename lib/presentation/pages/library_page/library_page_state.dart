import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';

part 'library_page_state.freezed.dart';

@freezed
abstract class LibraryPageState with _$LibraryPageState {
  const factory LibraryPageState.loading() = _LibraryPageStateLoading;

  const factory LibraryPageState.error() = _LibraryPageStateError;

  const factory LibraryPageState.idle({
    required List<BaseMovie> movies,
  }) = LibraryPageStateIdle;
}
