import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vasture/presentation/components/navigation_bar/notifier.dart';
import 'package:vasture/presentation/theme/app_colors.dart';

import '../animation/bounced_animation.dart';

class NavigationItem extends HookConsumerWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.pageType,
    required this.onPressed,
  });

  final Widget icon;
  final ScreenType pageType;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(appNavigationBarIndexProvider);

    return BouncedAnimation(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          // NOTE もし、現在選択しているタブと一致したら背景色を変える
          color: pageType.index == currentIndex
              ? AppColors.secondary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(14),
        child: icon,
      ),
    );
  }
}