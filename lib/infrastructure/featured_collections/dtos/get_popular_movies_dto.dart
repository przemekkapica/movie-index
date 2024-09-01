import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/featured_movie_dto.dart';

part 'get_popular_movies_dto.g.dart';

@JsonSerializable(createToJson: false)
class GetPopularMoviesDTO {
  GetPopularMoviesDTO({
    required this.page,
    required this.results,
  });

  factory GetPopularMoviesDTO.fromJson(Map<String, dynamic> json) =>
      _$GetPopularMoviesDTOFromJson(json);

  final int page;
  final List<FeaturedMovieDTO> results;
}
