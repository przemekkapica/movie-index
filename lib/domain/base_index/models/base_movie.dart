import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_movie.freezed.dart';

@freezed
abstract class BaseMovie with _$BaseMovie {
  const factory BaseMovie({
    required int id,
    required double rating,
    required String posterUrl,
    required int voteCount,
    required DateTime releaseDate,
  }) = _BaseMovie;
}
