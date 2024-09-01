import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_index/domain/base_index/models/base_movie.dart';
import 'package:movie_index/presentation/extensions/date_time_extension.dart';

class MovieListEntry extends StatelessWidget {
  const MovieListEntry({
    required this.movie,
    super.key,
  });

  final BaseMovie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to movie details
      },
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MoviePoster(movie: movie),
            const Gap(16),
            _MovieBasicData(movie: movie),
          ],
        ),
      ),
    );
  }
}

class _MovieBasicData extends StatelessWidget {
  const _MovieBasicData({
    required this.movie,
  });

  final BaseMovie movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title),
          const Gap(8),
          Text(movie.releaseDate.formatYYYY()),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.star_rate_rounded),
              const Gap(4),
              Text(movie.rating.toStringAsFixed(1)),
              const Gap(2),
              Text('(${movie.voteCount})'),
            ],
          ),
          const Gap(4),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    required this.movie,
  });

  final BaseMovie movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: movie.posterUrl,
      imageBuilder: (context, imageProvider) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          child: Image(image: imageProvider),
        );
      },
      height: 120,
    );
  }
}
