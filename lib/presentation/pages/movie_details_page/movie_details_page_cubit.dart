import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/domain/base_index/base_index_repository.dart';
import 'package:movie_index/presentation/pages/movie_details_page/movie_details_page_state.dart';

@Injectable()
class MovieDetailsPageCubit extends Cubit<MovieDetailsPageState> {
  MovieDetailsPageCubit(
    this._indexRepository,
  ) : super(const MovieDetailsPageState.loading());

  final BaseIndexRepository _indexRepository;

  Future<void> init({required int movieId}) async {
    try {
      final movieDetails =
          await _indexRepository.getMovieDetails(movieId, null);
      emit(MovieDetailsPageState.idle(movieDetails: movieDetails));
    } catch (_) {
      emit(const MovieDetailsPageState.error());
    }
  }
}
