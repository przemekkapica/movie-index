import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/domain/base_index/base_index_repository.dart';
import 'package:movie_index/presentation/pages/library_page/library_page_state.dart';

@Injectable()
class LibraryPageCubit extends Cubit<LibraryPageState> {
  LibraryPageCubit(
    this._indexRepository,
  ) : super(const LibraryPageState.loading());

  final BaseIndexRepository _indexRepository;

  Future<void> init() async {
    try {
      final movies = await _indexRepository.getMovies();

      emit(LibraryPageState.idle(movies: movies));
    } catch (error) {
      emit(const LibraryPageState.error());
    }
    return;
  }
}
