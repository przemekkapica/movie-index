import 'package:freezed_annotation/freezed_annotation.dart';

part 'featured_movie.freezed.dart';

@freezed
abstract class FeaturedMovie with _$FeaturedMovie {
  const factory FeaturedMovie({
    required int id,
    required double rating,
    required String posterUrl,
  }) = _FeaturedMovie;
}
