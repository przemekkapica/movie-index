import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/infrastructure/base_index/dtos/get_movies_dto.dart';
import 'package:movie_index/infrastructure/base_index/dtos/movie_details_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'base_index_data_source.g.dart';

@RestApi()
@Injectable()
abstract interface class BaseIndexDataSource {
  @factoryMethod
  factory BaseIndexDataSource(Dio dio) = _BaseIndexDataSource;

  @GET('discover/movie')
  Future<GetMoviesDTO> getMovies(@Query('page') int? page);

  @GET('movie/{id}')
  Future<MovieDetailsDTO> getMovieDetails(
    @Path() String id,
    @Query('append_to_response') String extraParams,
  );
}
