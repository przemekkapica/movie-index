import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/featured_collections/models/featured_movie.dart';

part 'discover_page_state.freezed.dart';

@freezed
abstract class DiscoverPageState with _$DiscoverPageState {
  const factory DiscoverPageState.loading() = _DiscoverPageStateLoading;

  const factory DiscoverPageState.error() = _DiscoverPageStateError;

  const factory DiscoverPageState.idle({
    required List<FeaturedMovie> popularMovies,
    required List<FeaturedMovie> topRatedMovies,
    required List<FeaturedMovie> nowPlayingMovies,
    required List<FeaturedMovie> upcomingMovies,
  }) = DiscoverPageStateIdle;
}
