import 'package:injectable/injectable.dart';
import 'package:movie_index/domain/featured_collections/featured_collections_repository.dart';
import 'package:movie_index/infrastructure/featured_collections/data_sources/featured_collections_data_source.dart';

@LazySingleton(as: FeaturedCollectionsRepository)
class FeaturedCollectionsRepositoryImpl
    implements FeaturedCollectionsRepository {
  FeaturedCollectionsRepositoryImpl(this._dataSource);

  final FeaturedCollectionsDataSource _dataSource;

  @override
  Future<FeaturedCollection> getPopularMovies() async {
    final result = await _dataSource.getPopularMovies();

    return result.results.map((movie) => movie.toDomain()).toList();
  }

  @override
  Future<FeaturedCollection> getNowPlayingMovies() {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<FeaturedCollection> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<FeaturedCollection> getUpcomingMovies() {
    // TODO: implement getUpcomingMovies
    throw UnimplementedError();
  }
}
