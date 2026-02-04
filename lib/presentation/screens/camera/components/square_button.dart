import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vasture/presentation/components/animation_button/bounced_animation_button.dart';
import 'package:vasture/presentation/utils/theme/app_shadows.dart';

class SquareButton extends HookConsumerWidget {
  const SquareButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
  });

  final void Function() onTap;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BouncedAnimationButton(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 65,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [AppShadows.primary],
        ),
        child: icon,
      ),
    );
  }
}
