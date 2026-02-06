import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vasture/core/config/app_config.dart';
import 'package:vasture/presentation/components/tutorial_modal.dart';
import 'package:vasture/presentation/providers/photo_provider.dart';
import 'package:vasture/presentation/providers/tutorial_provider.dart';
import 'package:vasture/presentation/providers/user_provider.dart';
import 'package:vasture/presentation/providers/weather_provider.dart';
import 'package:vasture/presentation/components/button/square_button.dart';
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

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!isTutorialCompleted && !hasShownTutorial.value) {
          hasShownTutorial.value = true;
          await TutorialModal.show(
            context: context,
            text:
                'あなたの空と世界の誰かが撮った空を\n交換しよう！\n\nあなたの写真と世界からの一枚の写真は\nホーム画面に表示されるよ！\n\nグレーのボタンを押してね。',
          );
        }
      });
      return null;
    }, [isTutorialCompleted]);

    Future<void> showErrorModal(String message) async {
      if (!context.mounted) return;
      await TutorialModal.show(
        context: context,
        text: message,
      );
    }

    // NOTE: 天気をDBに保存->画像をアップロード->世界の1枚の空を見つける->onPhotoMatched発火
    Future<void> confirmPhoto() async {
      await ref.read(userProvider.notifier).initialize();

      final userState = ref.watch(userProvider);
      if (userState.user == null) {
        await showErrorModal('ユーザー情報の初期化に失敗しました〜\nアプリを再起動してもう一度試してください。');
        return;
      }

      await ref.read(weatherProvider.notifier).fetchCurrentWeather();
      final weatherState = ref.read(weatherProvider);

      if (weatherState.weather == null) {
        await showErrorModal('天気情報の取得に失敗しました〜\nアプリを再起動してもう一度試してください。');
        return;
      }

      final savedWeather =
          await ref.read(weatherProvider.notifier).saveCurrentWeather();

      if (savedWeather == null) {
        await showErrorModal('天気情報の保存に失敗しました〜\nアプリを再起動してもう一度試してください。');
        return;
      }

      await ref.read(photoProvider.notifier).uploadPhoto(
            userId: userState.user!.id,
            imagePath: imagePath,
            weatherId: savedWeather.id,
          );

      final userPhoto = ref.read(photoProvider).latestPhoto;
      if (userPhoto == null) {
        await showErrorModal('写真のアップロードに失敗しました〜\nアプリを再起動してもう一度試してください。');
        return;
      }

      final otherPhoto = await ref
          .read(photoProvider.notifier)
          .getTodayPhotoByOtherUser(userState.user!.id);

      if (otherPhoto == null) {
        await showErrorModal(
            '今日、あなたはこのアプリの世界で空を撮った初めてのユーザーです！すごい！\n特別な空をご覧あれ。');
        await ref.read(photoProvider.notifier).saveMatchedPhotos(
              userPhotoId: userPhoto.id,
              matchedPhotoId: '548ec0c2-3e9d-4782-83a9-93608117ad06',
            );

        onPhotoMatched(AppConfig.otherImageUrl);
        return;
      }

      await ref.read(photoProvider.notifier).saveMatchedPhotos(
            userPhotoId: userPhoto.id,
            matchedPhotoId: otherPhoto.id,
          );

      onPhotoMatched(otherPhoto.imageUrl);
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
