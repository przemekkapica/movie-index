import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';
import 'package:movie_index/infrastructure/base_index/dtos/movie_dto.dart';

part 'get_movies_dto.g.dart';

@JsonSerializable(createToJson: false)
class GetMoviesDTO {
  GetMoviesDTO({
    required this.page,
    required this.results,
  });

  factory GetMoviesDTO.fromJson(Map<String, dynamic> json) =>
      _$GetMoviesDTOFromJson(json);

  final int page;
  final List<MovieDTO> results;

  List<BaseMovie> toDomain() {
    return results.map((movie) => movie.toDomain()).toList();
  }
}
