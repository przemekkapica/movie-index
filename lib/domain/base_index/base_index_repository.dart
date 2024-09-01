import 'package:movie_index/domain/base_index/models/base_movie.dart';

abstract interface class BaseIndexRepository {
  Future<List<BaseMovie>> getMovies({int? page});
}
