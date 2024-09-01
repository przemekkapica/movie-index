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
      emit(const DiscoverPageState.error());
      final featuredCollections = await Future.wait([
        _collectionsRepository.getPopularMovies(),
        _collectionsRepository.getTopRatedMovies(),
        _collectionsRepository.getNowPlayingMovies(),
        _collectionsRepository.getUpcomingMovies(),
      ]);

      // Shuffled just for the presentation purpose
      // (it usually yields very familiar results as popular movies)
      featuredCollections[2].shuffle();

      emit(
        DiscoverPageState.idle(
          popularMovies: featuredCollections[0],
          topRatedMovies: featuredCollections[1],
          nowPlayingMovies: featuredCollections[2],
          upcomingMovies: featuredCollections[3],
        ),
      );
    } catch (_) {
      emit(const DiscoverPageState.error());
    }
    return;
  }
}
