import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vasture/presentation/components/shimmer/shimmer_container.dart';

import '../../../../domain/entities/sky_photo.dart';

class PhotoSwiper extends HookConsumerWidget {
  final SkyPhoto userPhoto;
  final SkyPhoto? matchedPhoto;

  const PhotoSwiper({
    super.key,
    required this.userPhoto,
    this.matchedPhoto,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperController = useMemoized(() => SwiperController());

    useEffect(() {
      return swiperController.dispose;
    }, [swiperController]);
    final photos = [
      userPhoto,
      if (matchedPhoto != null) matchedPhoto!,
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Swiper(
              itemCount: photos.length,
              layout: SwiperLayout.STACK,
              controller: swiperController,
              itemHeight: MediaQuery.of(context).size.height * 0.8,
              itemWidth: MediaQuery.of(context).size.width,
              loop: false,
              axisDirection: AxisDirection.right,
              itemBuilder: (context, index) {
                if (index == 1) {
                  return _buildMatchedPhotoCard(photos[index], true);
                }
                return _buildPhotoCard(photos[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPhotoCard(SkyPhoto photo) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fadeInDuration: const Duration(milliseconds: 100),
              imageUrl: photo.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ShimmerContainer(),
              errorWidget: (context, url, error) => const ShimmerContainer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchedPhotoCard(SkyPhoto photo, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fadeInDuration: const Duration(milliseconds: 100),
              imageUrl: photo.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ShimmerContainer(),
              errorWidget: (context, url, error) => const ShimmerContainer(),
            ),
            // TODO: 通報機能をつける
            // Positioned(
            //   top: 16,
            //   left: 16,
            //   child: IconButton(
            //     highlightColor: Colors.transparent,
            //     onPressed: () {
            //     },
            //     icon: const Icon(LucideIcons.flag, color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
