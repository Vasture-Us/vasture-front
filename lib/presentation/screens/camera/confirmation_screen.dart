import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vasture/presentation/components/custom_modal.dart';
import 'package:vasture/presentation/providers/tutorial_provider.dart';
import 'package:vasture/presentation/components/button/square_button.dart';
import 'package:vasture/presentation/services/photo_confirmation_service.dart';
import 'package:vasture/presentation/utils/state/loading_state.dart';
import 'package:vasture/presentation/utils/theme/app_colors.dart';
import 'package:vasture/presentation/utils/theme/app_text_styles.dart';

class ConfirmationScreen extends HookConsumerWidget {
  const ConfirmationScreen({
    super.key,
    required this.imagePath,
    required this.onReturn,
    required this.onPhotoMatched,
  });

  final String imagePath;
  final void Function() onReturn;
  final void Function(String matchedPhotoUrl) onPhotoMatched;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTutorialCompleted = ref.watch(tutorialProvider).isCompleted;
    final hasShownTutorial = useRef(false);

    Future<void> showCustomModal(String message) async {
      if (!context.mounted) return;
      await CustomModal.show(
        context: context,
        text: message,
      );
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!isTutorialCompleted && !hasShownTutorial.value) {
          hasShownTutorial.value = true;
          await showCustomModal(
              'あなたの空と世界の誰かが撮った空を\n交換しよう！\n\nあなたの写真と世界からの一枚の写真は\nホーム画面に表示されるよ！\n\nグレーのボタンを押してね。');
        }
      });
      return null;
    }, [isTutorialCompleted]);

    Future<void> confirmPhoto() async {
      final service = PhotoConfirmationService(ref);
      final result = await service.confirmAndMatchPhoto(imagePath);

      if (result.hasError) {
        await showCustomModal(result.errorMessage!);
        return;
      }

      if (result.isFirstUserToday) {
        await showCustomModal(
          '今日、あなたはこのアプリの世界で空を撮った初めてのユーザーです！すごい！\n特別な空をご覧あれ。',
        );
      }

      if (result.matchedPhotoUrl != null) {
        onPhotoMatched(result.matchedPhotoUrl!);
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
                      onPressed: onReturn,
                      icon: const Icon(LucideIcons.moveLeft),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Exchange Your Sky.',
                  style: AppTextStyles.displaySmall,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SquareButton(
                onTap: () async {
                  ref
                      .read(loadingStateNotifierProvider.notifier)
                      .whileLoading(() async {
                    await confirmPhoto();
                  });
                },
                icon: const Icon(
                  LucideIcons.sendHorizontal,
                  color: Colors.white,
                ),
                color: AppColors.primary,
              ),
              const Gap(48),
            ],
          ),
        ),
      ),
    );
  }
}
