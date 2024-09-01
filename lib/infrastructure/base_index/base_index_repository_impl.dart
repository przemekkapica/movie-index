import 'package:injectable/injectable.dart';
import 'package:movie_index/domain/base_index/base_index_repository.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';
import 'package:movie_index/infrastructure/base_index/data_sources/base_index_data_source.dart';

@LazySingleton(as: BaseIndexRepository)
class BaseIndexRepositoryImpl implements BaseIndexRepository {
  BaseIndexRepositoryImpl(this._dataSource);

  final BaseIndexDataSource _dataSource;

  @override
  Future<List<BaseMovie>> getMovies({int? page}) async {
    final result = await _dataSource.getMovies(page);

    return result.toDomain();
  }
}
