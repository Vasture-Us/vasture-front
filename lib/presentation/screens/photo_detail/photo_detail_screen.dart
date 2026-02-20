import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:vasture/domain/entities/weather.dart';
import 'package:vasture/presentation/providers/weather_provider.dart';
import 'package:vasture/presentation/screens/photo_detail/photo_detail_screen_shimmer.dart';
import 'package:vasture/presentation/utils/helpers/custom_date_formatter.dart';
import 'package:vasture/presentation/utils/helpers/weather_condition_converter.dart';
import 'package:vasture/presentation/utils/theme/app_text_styles.dart';
import '../../utils/theme/app_colors.dart';
import '../weather/components/photo_swiper.dart';
import '../../components/weather_shape.dart';
import '../../providers/photo_provider.dart';

class PhotoDetailScreen extends HookConsumerWidget {
  final String photoId;

  const PhotoDetailScreen({
    super.key,
    required this.photoId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(true);
    final weatherState = useState<Weather?>(null);
    final weather = weatherState.value;

    final photoState = ref.watch(photoProvider);
    final matchedPhoto = photoState.latestMatchedPhoto;
    final photo = photoState.photos.firstWhere(
      (p) => p.id == photoId,
      orElse: () => throw Exception('Photo not found'),
    );
    final label =
        WeatherConditionConverter.getLabel(weather?.condition ?? '100');

    useEffect(() {
      Future<void> loadData() async {
        final matchedPhoto =
            await ref.read(photoProvider.notifier).loadMatchedPhoto(photoId);

        if (matchedPhoto == null) {
          isLoading.value = false;
          return;
        }

        weatherState.value = await ref
            .read(weatherProvider.notifier)
            .getWeatherById(matchedPhoto.weatherId ?? '');
      }

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await loadData();
        isLoading.value = false;
      });

      return null;
    }, [photoId]);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(LucideIcons.arrowLeft),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: isLoading.value
            ? const PhotoDetailScreenShimmer()
            : Stack(
                children: [
                  Positioned(
                    bottom: -20,
                    right: 0,
                    child: WeatherShape(
                      assetPath: 'assets/shapes/photo_detail_bottom_shape.svg',
                      weatherCondition: weather?.condition ?? '100',
                    ),
                  ),
                  Column(
                    children: [
                      const Gap(36),
                      Expanded(
                        child: PhotoSwiper(
                          userPhoto: photo,
                          matchedPhoto: matchedPhoto,
                        ),
                      ),
                      const Gap(54),
                      Padding(
                        padding: const EdgeInsets.only(left: 54),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              CustomDateFormatter()
                                  .formatDateWithOrdinal(photo.createdAt),
                              style: AppTextStyles.headlineLarge,
                            ),
                            const Gap(28),
                            Row(
                              children: [
                                Text(
                                  '${weather?.temperature.round()}°',
                                  style: AppTextStyles.displayLarge,
                                ),
                                const Gap(12),
                                Text(
                                  '$label.',
                                  style: AppTextStyles.displayLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(54),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
