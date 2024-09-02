import 'package:movie_index/domain/base_index/models/base_movie.dart';
import 'package:movie_index/domain/base_index/models/movie_details.dart';

abstract interface class BaseIndexRepository {
  Future<List<BaseMovie>> getMovies({int? page});

  Future<MovieDetails> getMovieDetails(int id, [String? extraParams]);
}
