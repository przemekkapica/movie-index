import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/base_index/models/movie_details.dart';

part 'movie_details_page_state.freezed.dart';

@freezed
abstract class MovieDetailsPageState with _$MovieDetailsPageState {
  const factory MovieDetailsPageState.loading() = _MovieDetailsPageStateLoading;

  const factory MovieDetailsPageState.error() = _MovieDetailsPageStateError;

  const factory MovieDetailsPageState.idle({
    required MovieDetails movieDetails,
  }) = MovieDetailsPageStateIdle;
}
