import 'package:movie_index/domain/featured_collections/models/featured_movie.dart';

typedef FeaturedCollection = List<FeaturedMovie>;

abstract interface class FeaturedCollectionsRepository {
  Future<FeaturedCollection> getPopularMovies();

  Future<FeaturedCollection> getTopRatedMovies();

  Future<FeaturedCollection> getNowPlayingMovies();

  Future<FeaturedCollection> getUpcomingMovies();
}
