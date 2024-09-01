import 'package:movie_index/core/config/env_config.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/get_popular_movies_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@Injectable()
@RestApi(baseUrl: EnvConfig.apiBaseUrl)
abstract interface class FeaturedCollectionsDataSource {
  @factoryMethod
  factory FeaturedCollectionsDataSource(Dio dio) =
      _FeaturedCollectionsDataSource;

  @GET('movie/popular')
  Future<GetPopularMoviesDTO> getPopularMovies();
}
