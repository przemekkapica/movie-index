import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/featured_movie_dto.dart';

@JsonSerializable()
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
