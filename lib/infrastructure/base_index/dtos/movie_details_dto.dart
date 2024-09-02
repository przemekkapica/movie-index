import 'package:json_annotation/json_annotation.dart';
import 'package:movie_index/domain/base_index/models/genre.dart';
import 'package:movie_index/domain/base_index/models/movie_details.dart';

part 'movie_details_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieDetailsDTO {
  MovieDetailsDTO({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.credits,
  });

  factory MovieDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDTOFromJson(json);

  @JsonKey(name: 'adult')
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  dynamic belongsToCollection;
  @JsonKey(name: 'budget')
  int budget;
  @JsonKey(name: 'genres')
  List<GenreDTO> genres;
  @JsonKey(name: 'homepage')
  String homepage;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  @JsonKey(name: 'origin_country')
  List<String> originCountry;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'overview')
  String overview;
  @JsonKey(name: 'popularity')
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompanyDTO> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountryDTO> productionCountries;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;
  @JsonKey(name: 'revenue')
  int revenue;
  @JsonKey(name: 'runtime')
  int runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguageDTO> spokenLanguages;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'tagline')
  String tagline;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'video')
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'credits')
  CreditsDTO credits;

  MovieDetails toDomain() {
    return MovieDetails(
      id: id,
      title: title,
      description: overview,
      posterUrl: 'https://image.tmdb.org/t/p/original/$posterPath',
      genres: genres.map((genre) => genre.toDomain()).toList(),
      runtime: Duration(minutes: runtime),
      rating: voteAverage,
      voteCount: voteCount,
      directorName: credits.crew
          .where((crew) => crew.job == 'Director')
          .firstOrNull
          ?.name,
      productionCountries:
          productionCountries.map((country) => country.name).toList(),
      distributors: productionCompanies.map((country) => country.name).toList(),
      releaseDate: releaseDate,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      budget: budget,
    );
  }
}

@JsonSerializable(createToJson: false)
class CreditsDTO {
  CreditsDTO({
    required this.cast,
    required this.crew,
  });

  factory CreditsDTO.fromJson(Map<String, dynamic> json) =>
      _$CreditsDTOFromJson(json);

  @JsonKey(name: 'cast')
  List<CastDTO> cast;
  @JsonKey(name: 'crew')
  List<CastDTO> crew;
}

@JsonSerializable(createToJson: false)
class CastDTO {
  CastDTO({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    this.castId,
    this.character,
    this.order,
    this.department,
    this.job,
  });

  factory CastDTO.fromJson(Map<String, dynamic> json) =>
      _$CastDTOFromJson(json);

  @JsonKey(name: 'adult')
  bool adult;
  @JsonKey(name: 'gender')
  int gender;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'original_name')
  String originalName;
  @JsonKey(name: 'popularity')
  double popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'cast_id')
  int? castId;
  @JsonKey(name: 'character')
  String? character;
  @JsonKey(name: 'credit_id')
  String creditId;
  @JsonKey(name: 'order')
  int? order;
  @JsonKey(name: 'department')
  String? department;
  @JsonKey(name: 'job')
  String? job;
}

@JsonSerializable(createToJson: false)
class GenreDTO {
  GenreDTO({
    required this.id,
    required this.name,
  });

  factory GenreDTO.fromJson(Map<String, dynamic> json) =>
      _$GenreDTOFromJson(json);

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;

  Genre toDomain() {
    return Genre(id: id, name: name);
  }
}

@JsonSerializable(createToJson: false)
class ProductionCompanyDTO {
  ProductionCompanyDTO({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyDTOFromJson(json);

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'origin_country')
  String originCountry;
}

@JsonSerializable(createToJson: false)
class ProductionCountryDTO {
  ProductionCountryDTO({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountryDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryDTOFromJson(json);

  @JsonKey(name: 'iso_3166_1')
  String iso31661;
  @JsonKey(name: 'name')
  String name;
}

@JsonSerializable(createToJson: false)
class SpokenLanguageDTO {
  SpokenLanguageDTO({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageDTO.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageDTOFromJson(json);

  @JsonKey(name: 'english_name')
  String englishName;
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  @JsonKey(name: 'name')
  String name;
}
