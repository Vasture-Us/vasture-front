import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vasture/presentation/components/button/bounced_animation_button.dart';
import 'package:vasture/presentation/components/weather_shape.dart';
import 'package:vasture/presentation/providers/weather_provider.dart';
import 'package:vasture/presentation/screens/weather_book/components/month_card.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import '../../components/shimmer/flexible_shimmer_container.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_text_styles.dart';
import '../../providers/user_provider.dart';
import '../../providers/photo_provider.dart';

class WeatherBookScreen extends HookConsumerWidget {
  const WeatherBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);
    final groupedPhotos = useState(<String, List<dynamic>>{});
    final isLoading = useState(true);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final userId = ref.read(userProvider).user?.id;
        if (userId != null) {
          final photos =
              await ref.read(photoProvider.notifier).loadUserPhotos(userId);

          if (photos != null) {
            final Map<String, List<dynamic>> groupedPhotosMap = {};
            for (final photo in photos) {
              final month = DateFormat('MMMM yyyy').format(photo.createdAt);
              groupedPhotosMap.putIfAbsent(month, () => []);
              groupedPhotosMap[month]!.add(photo);
            }
            groupedPhotos.value = groupedPhotosMap;
          }
        }
        isLoading.value = false;
      });

      return null;
    }, []);

    Widget buildShimmerPlaceholders() {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          children: List.generate(
            3,
            (_) => FlexibleShimmerContainer(
              width: MediaQuery.of(context).size.width,
              height: 200,
              radius: 24,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: isLoading.value
          ? buildShimmerPlaceholders()
          : groupedPhotos.value.isEmpty
              ? const Center(
                  child: Text(
                    'No photos yet.\nStart capturing the sky!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleLarge,
                  ),
                )
              : Stack(
                  children: [
                    WeatherShape(
                      weatherCondition:
                          weatherState.weather?.condition ?? '100',
                    ),
                    SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(80),
                            Align(
                              alignment: Alignment.topRight,
                              child: BouncedAnimationButton(
                                onTap: () {
                                  const SettingScreenRoute().go(context);
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(LucideIcons.settings),
                                ),
                              ),
                            ),
                            const Text(
                              'Your Weather Book.',
                              style: AppTextStyles.headlineLarge,
                            ),
                            ListView.builder(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 120),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: groupedPhotos.value.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final date =
                                    groupedPhotos.value.keys.elementAt(index);
                                final photos = groupedPhotos.value[date]!;
                                final firstPhoto = photos.first;

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 24),
                                  child: MonthCard(
                                    label: date,
                                    imageUrl: firstPhoto.imageUrl,
                                    onTap: () =>
                                        PhotoScreenRoute(date).go(context),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
