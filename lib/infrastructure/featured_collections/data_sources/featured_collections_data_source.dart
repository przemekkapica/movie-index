import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/get_now_playing_movies_dto.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/get_popular_movies_dto.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/get_top_rated_movies_dto.dart';
import 'package:movie_index/infrastructure/featured_collections/dtos/get_upcoming_movies_dto.dart';
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

  @GET('movie/top_rated')
  Future<GetTopRatedMoviesDTO> getTopRatedMovies();

  @GET('movie/upcoming')
  Future<GetUpcomingMoviesDTO> getUpcomingMovies();

  @GET('movie/now_playing')
  Future<GetNowPlayingMoviesDTO> getNowPlayingMovies();
}
