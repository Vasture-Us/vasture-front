import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:vasture/presentation/components/shimmer/shimmer_container.dart';
import 'package:vasture/presentation/providers/tutorial_provider.dart';
import 'package:vasture/presentation/screens/camera/components/square_button.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import 'package:vasture/presentation/utils/state/loading_state.dart';
import 'package:vasture/presentation/utils/theme/app_colors.dart';
import 'package:vasture/presentation/utils/theme/app_text_styles.dart';

class FoundSkyScreen extends HookConsumerWidget {
  const FoundSkyScreen({
    super.key,
    required this.matchedImageUrl,
  });

  final String matchedImageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> completeTutorial() async {
      ref.read(loadingStateNotifierProvider.notifier).whileLoading(
        () async {
          await ref.read(tutorialProvider.notifier).completeTutorial();
        },
      );
      if (context.mounted) {
        const WeatherScreenRoute().go(context);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () async {
                        await completeTutorial();
                      },
                      icon: const Icon(LucideIcons.x),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'We Found This Sky.',
                  style: AppTextStyles.displaySmall,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: CachedNetworkImage(
                      imageUrl: matchedImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const ShimmerContainer(),
                      errorWidget: (context, url, error) => const ShimmerContainer(),
                    ),
                  ),
                ),
              ),
              const Gap(24),
              SquareButton(
                onTap: () async {
                  await completeTutorial();
                },
                icon: const Icon(
                  LucideIcons.check,
                  color: Colors.white,
                ),
                color: AppColors.textPrimary,
              ),
              const Gap(48),
            ],
          ),
        ),
      ),
    );
  }
}
