import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_index/domain/base_index/models/genre.dart';

part 'movie_details.freezed.dart';

@freezed
abstract class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required int id,
    required String title,
    required String description,
    required String posterUrl,
    required List<Genre> genres,
    required Duration runtime,
    required double rating,
    required int voteCount,
    required String? directorName,
    required List<String> productionCountries,
    required List<String> distributors,
    required DateTime releaseDate,
    required String originalLanguage,
    required String originalTitle,
    required int budget,
  }) = _MovieDetails;
}
