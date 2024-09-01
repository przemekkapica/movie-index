import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_index/domain/featured_collections/models/featured_movie.dart';

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
        Text(title),
        const Gap(12),
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
        viewportFraction: 0.4,
        height: 200,
        padEnds: false,
      ),
      itemCount: collection.length,
      itemBuilder: (context, itemIndex, _) {
        final movieEntry = collection[itemIndex];

        return CachedNetworkImage(
          fadeInDuration: _fadeInCarouselDuration,
          fadeOutDuration: _fadeOutCarouselDuration,
          imageUrl: movieEntry.posterUrl,
          imageBuilder: (context, imageProvider) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image(
                fit: BoxFit.fitWidth,
                image: imageProvider,
              ),
            );
          },
        );
      },
    );
  }
}
