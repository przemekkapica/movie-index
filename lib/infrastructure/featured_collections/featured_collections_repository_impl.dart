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

    return result.toDomain();
  }

  @override
  Future<FeaturedCollection> getNowPlayingMovies() async {
    final result = await _dataSource.getNowPlayingMovies();

    return result.toDomain();
  }

  @override
  Future<FeaturedCollection> getTopRatedMovies() async {
    final result = await _dataSource.getTopRatedMovies();

    return result.toDomain();
  }

  @override
  Future<FeaturedCollection> getUpcomingMovies() async {
    final result = await _dataSource.getUpcomingMovies();

    return result.toDomain();
  }
}
