import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vasture/presentation/components/animation_button/bounced_animation_button.dart';
import 'package:vasture/presentation/components/navigation_bar/navigation_item.dart';
import 'package:vasture/presentation/components/navigation_bar/notifier.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexNotifier = ref.watch(appNavigationBarIndexProvider.notifier);

    // タブ選択時の処理
    void goBranch(ScreenType pageType) {
      indexNotifier.changePage(pageType);
      navigationShell.goBranch(
        pageType.index,
        initialLocation: pageType.index == navigationShell.currentIndex,
      );
    }

    return Scaffold(
      body: navigationShell,
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: BottomAppBar(
            padding: const EdgeInsets.only(top: 20),
            color: Colors.white.withValues(alpha: 0.24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationItem(
                  icon: const Icon(LucideIcons.sun),
                  pageType: ScreenType.weather,
                  onPressed: () => goBranch(ScreenType.weather),
                ),
                BouncedAnimationButton(
                  child: Transform.scale(
                    scale: 1.3,
                    child: SvgPicture.asset(
                      'assets/shapes/capture_button.svg',
                      width: 80,
                    ),
                  ),
                  onTap: () {
                    // TODO: カメラ画面へ遷移する
                    const CameraPageViewScreenRoute().go(context);
                  },
                ),
                NavigationItem(
                  icon: const Icon(LucideIcons.bookOpen),
                  pageType: ScreenType.weatherBook,
                  onPressed: () => goBranch(ScreenType.weatherBook),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
