import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vasture/presentation/components/button/square_button.dart';
import 'package:vasture/presentation/screens/weather/weather_screen_shimmer.dart';
import 'package:vasture/presentation/utils/helpers/weather_condition_converter.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_text_styles.dart';
import '../../components/weather_shape.dart';
import 'components/photo_swiper.dart';
import '../../providers/user_provider.dart';
import '../../providers/weather_provider.dart';
import '../../providers/photo_provider.dart';

class WeatherScreen extends HookConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);
    final photoState = ref.watch(photoProvider);

    final weather = weatherState.weather;
    final label = WeatherConditionConverter.getLabel(
      weather?.condition ?? '100',
    );
    final latestPhoto = photoState.latestPhoto;
    final isLoading = useState(false);

    useEffect(() {
      Future<void> loadData() async {
        isLoading.value = true;
        await ref.read(userProvider.notifier).initialize();
        final userId = ref.read(userProvider).user?.id;
        if (userId != null) {
          await ref.read(weatherProvider.notifier).fetchCurrentWeather();
          final userTodayPhoto = await ref
              .read(photoProvider.notifier)
              .loadLatestTodayPhoto(userId);

          if (userTodayPhoto == null) {
            isLoading.value = false;
            return;
          }

          await ref
              .read(photoProvider.notifier)
              .loadMatchedPhoto(userTodayPhoto.id);

          isLoading.value = false;
        }
      }

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await loadData();
      });
      return null;
    }, []);

    Widget buildNoPhotoCard() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 36),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(48),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Vasture Today\'s Sky',
                style: AppTextStyles.headlineLarge,
              ),
              const SizedBox(height: 24),
              SquareButton(
                onTap: () {
                  const CameraPageViewScreenRoute().go(context);
                },
                width: 70,
                height: 60,
                color: Colors.white,
                icon: const Icon(LucideIcons.camera),
                radius: 20,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        child: isLoading.value || weather == null
            ? const WeatherScreenShimmer()
            : Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: WeatherShape(weatherCondition: weather.condition),
                  ),
                  Column(
                    children: [
                      const Gap(80),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${weather.temperature.round()}°',
                                    style: AppTextStyles.displayLarge,
                                  ),
                                  Text(
                                    '$label.',
                                    style: AppTextStyles.displayLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(32),
                      Expanded(
                        child: latestPhoto != null
                            ? PhotoSwiper(
                                    userPhoto: latestPhoto,
                                    matchedPhoto: photoState.latestMatchedPhoto,
                                  )
                            : buildNoPhotoCard(),
                      ),
                      const Gap(24),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
