import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vasture/presentation/screens/camera/camera_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vasture/presentation/screens/camera/found_sky_screen.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import 'package:vasture/presentation/utils/theme/app_colors.dart';

import './confirmation_screen.dart';

class CameraPageViewScreen extends HookConsumerWidget {
  const CameraPageViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = useRef<PageController>(PageController());
    final currentPageNum = useState(0);
    final imagePath = useState<String>('');
    final matchedImageUrl = useState<String>('');

    void goToNextPage() {
      if (currentPageNum.value < 2) {
        pageController.value.jumpToPage(
          currentPageNum.value + 1,
        );
      }
    }

    void goToPreviousPage() {
      if (currentPageNum.value > 0) {
        pageController.value.jumpToPage(
          currentPageNum.value - 1,
        );
      }
    }

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController.value,
          onPageChanged: (index) {
            currentPageNum.value = index;
          },
          children: [
            CameraScreen(
              onPhotoTaken: (returnedPath) {
                imagePath.value = returnedPath;
                // NOTE: 次の画面へアニメーションなしで遷移する
                goToNextPage();
              },
              onReturn: () {
                const WeatherScreenRoute().go(context);
              },
            ),
            ConfirmationScreen(
              imagePath: imagePath.value,
              onReturn: () {
                goToPreviousPage();
              },
              onPhotoMatched: (matchedPhotoUrl) {
                matchedImageUrl.value = matchedPhotoUrl;

                goToNextPage();
              },
            ),
            FoundSkyScreen(
              matchedImageUrl: matchedImageUrl.value,
            ),
          ],
        ),
        Positioned(
          bottom: 45,
          child: SmoothPageIndicator(
            controller: pageController.value,
            count: 3,
            effect: const WormEffect(
              spacing: 16,
              activeDotColor: AppColors.primary,
              dotColor: AppColors.secondary,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SvgPicture.asset(
            'assets/shapes/camera_shape.svg',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
