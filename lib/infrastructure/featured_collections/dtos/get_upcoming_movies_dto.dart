import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/featured_collections/featured_collections_repository.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/common/dates_span_dto.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/common/featured_movie_dto.dart';

part 'get_upcoming_movies_dto.g.dart';

@JsonSerializable(createToJson: false)
class GetUpcomingMoviesDTO {
  GetUpcomingMoviesDTO({
    required this.page,
    required this.dates,
    required this.results,
  });

  factory GetUpcomingMoviesDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUpcomingMoviesDTOFromJson(json);

  final int page;
  final DatesSpanDTO dates;
  final List<FeaturedMovieDTO> results;

  FeaturedCollection toDomain() {
    return results.map((movie) => movie.toDomain()).toList();
  }
}
