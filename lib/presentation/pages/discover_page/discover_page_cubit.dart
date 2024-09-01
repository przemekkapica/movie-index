import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/domain/featured_collections/featured_collections_repository.dart';
import 'package:movie_index/presentation/pages/discover_page/discover_page_state.dart';

@Injectable()
class DiscoverPageCubit extends Cubit<DiscoverPageState> {
  DiscoverPageCubit(
    this._collectionsRepository,
  ) : super(const DiscoverPageState.loading());

  final FeaturedCollectionsRepository _collectionsRepository;

  Future<void> init() async {
    try {
      final popularMovies = await _collectionsRepository.getPopularMovies();

      emit(DiscoverPageState.idle(popularMovies: popularMovies));
    } catch (_) {
      emit(const DiscoverPageState.error());
    }
    return;
  }
}
