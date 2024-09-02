import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_index/domain/featured_collections/models/featured_movie.dart';
import 'package:movie_index/presentation/routing/app_router.gr.dart';
import 'package:movie_index/presentation/theme/app_colors.dart';
import 'package:movie_index/presentation/theme/app_dimens.dart';
import 'package:movie_index/presentation/theme/app_typo.dart';
import 'package:movie_index/presentation/widgets/rating_icon.dart';

class CollectionData {
  CollectionData({
    required this.title,
    required this.collection,
  });

  final String title;
  final List<FeaturedMovie> collection;
}

const _fadeInCarouselDuration = Duration(milliseconds: 150);
const _fadeOutCarouselDuration = Duration(milliseconds: 150);
const _posterWidth = 200.0;
const _carouselViewportFraction = 0.36;

class CollectionCarouselSection extends StatelessWidget {
  const CollectionCarouselSection({
    required this.collectionData,
    super.key,
  });

  final CollectionData collectionData;

  @override
  Widget build(BuildContext context) {
    final title = collectionData.title;
    final collection = collectionData.collection;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypo.v3,
        ),
        const Gap(AppDimens.v12),
        _CollectionCarousel(collection: collection),
      ],
    );
  }
}

class _CollectionCarousel extends StatelessWidget {
  const _CollectionCarousel({
    required this.collection,
  });

  final List<FeaturedMovie> collection;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        viewportFraction: _carouselViewportFraction,
        padEnds: false,
      ),
      itemCount: collection.length,
      itemBuilder: (context, itemIndex, _) {
        final movieEntry = collection[itemIndex];

        return Padding(
          padding: const EdgeInsets.only(right: AppDimens.v12),
          child: GestureDetector(
            onTap: () => context.router.push(
              MovieDetailsRoute(movieId: movieEntry.id),
            ),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                _Poster(posterUrl: movieEntry.posterUrl),
                Positioned(
                  bottom: AppDimens.v4,
                  left: AppDimens.v4,
                  child: _RatingTag(rating: movieEntry.rating),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({
    required this.posterUrl,
  });

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: _fadeInCarouselDuration,
      fadeOutDuration: _fadeOutCarouselDuration,
      imageUrl: posterUrl,
      imageBuilder: (context, imageProvider) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image(
            fit: BoxFit.fitHeight,
            image: imageProvider,
            width: _posterWidth,
          ),
        );
      },
    );
  }
}

class _RatingTag extends StatelessWidget {
  const _RatingTag({
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.tag.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.v4,
        ),
        child: Row(
          children: [
            const RatingIcon(size: AppDimens.v12),
            const Gap(AppDimens.v4),
            Text(
              rating.toStringAsFixed(1),
              style: AppTypo.v7,
            ),
          ],
        ),
      ),
    );
  }
}
