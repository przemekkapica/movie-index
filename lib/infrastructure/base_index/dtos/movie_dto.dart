import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieDTO {
  MovieDTO({
    required this.id,
    required this.title,
    required this.video,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
  });

  factory MovieDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieDTOFromJson(json);

  final int id;
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final String title;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  BaseMovie toDomain() {
    return BaseMovie(
      id: id,
      title: title,
      rating: voteAverage,
      posterUrl: 'https://image.tmdb.org/t/p/original/$posterPath',
      voteCount: voteCount,
      releaseDate: DateTime.parse(releaseDate),
    );
  }
}
