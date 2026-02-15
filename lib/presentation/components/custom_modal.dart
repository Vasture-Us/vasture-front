import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vasture/presentation/utils/theme/app_colors.dart';
import 'package:vasture/presentation/utils/theme/app_text_styles.dart';

class CustomModal extends HookConsumerWidget {
  const CustomModal({
    super.key,
    required this.text,
  });

  final String text;

  static Future<void> show({
    required BuildContext context,
    required String text,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.35),
      builder: (context) => CustomModal(text: text),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(LucideIcons.x),
                  ),
                ),
                Text(
                  text,
                  style: AppTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                const Gap(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
