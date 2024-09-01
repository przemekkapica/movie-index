import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/get_popular_movies_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'featured_collections_data_source.g.dart';

@Injectable()
@RestApi()
abstract interface class FeaturedCollectionsDataSource {
  @factoryMethod
  factory FeaturedCollectionsDataSource(Dio dio) =
      _FeaturedCollectionsDataSource;

  @GET('movie/popular')
  Future<GetPopularMoviesDTO> getPopularMovies();
}
