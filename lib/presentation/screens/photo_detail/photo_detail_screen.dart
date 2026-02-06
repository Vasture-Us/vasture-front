import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vasture/domain/entities/sky_photo.dart';
import '../../utils/theme/app_colors.dart';
import '../weather/components/photo_swiper.dart';
import '../../components/weather_shape.dart';
import '../../providers/photo_provider.dart';

class PhotoDetailScreen extends ConsumerStatefulWidget {
  final SkyPhoto photo;

  const PhotoDetailScreen({
    super.key,
    required this.photo,
  });

  @override
  ConsumerState<PhotoDetailScreen> createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends ConsumerState<PhotoDetailScreen> {
  @override
  void initState() {
    super.initState();
    _loadMatch();
  }

  Future<void> _loadMatch() async {
    await ref.read(photoProvider.notifier).loadMatchedPhoto(widget.photo.id);
  }

  @override
  Widget build(BuildContext context) {
    final photoState = ref.watch(photoProvider);
    final match = photoState.latestMatchedPhoto;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          DateFormat('MMMM d, y').format(widget.photo.createdAt),
          style: const TextStyle(
            fontFamily: 'InstrumentSerif',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Weather shape
            Positioned(
              top: -20,
              left: -20,
              child: WeatherShape(
                weatherCondition: 'Sunny', // TODO: Get from weather data
              ),
            ),

            Column(
              children: [
                const SizedBox(height: 48),

                // Weather info
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '12°', // TODO: Get from weather data
                          style: TextStyle(
                            fontFamily: 'InstrumentSerif',
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          DateFormat('EEEE').format(widget.photo.createdAt),
                          style: const TextStyle(
                            fontFamily: 'InstrumentSerif',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Expanded(
                  child: PhotoSwiper(
                    userPhoto: widget.photo,
                    matchedPhoto: match != null ? widget.photo : null,
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
