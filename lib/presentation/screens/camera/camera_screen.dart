import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:vasture/presentation/components/shimmer/shimmer_container.dart';
import 'package:vasture/presentation/components/tutorial_modal.dart';
import 'package:vasture/presentation/providers/tutorial_provider.dart';
import 'package:vasture/presentation/components/button/square_button.dart';
import 'package:vasture/presentation/utils/state/loading_state.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_text_styles.dart';

class CameraScreen extends HookConsumerWidget {
  const CameraScreen({
    super.key,
    required this.onPhotoTaken,
    required this.onReturn,
  });

  final void Function(String imagePath) onPhotoTaken;
  final void Function() onReturn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraController = useState<CameraController?>(null);
    final isCameraInitialized = useState(false);
    final hasShownTutorial = useRef(false);
    final loadingState = ref.read(loadingStateNotifierProvider.notifier);

    useEffect(() {
      Future<void> initializeCamera() async {
        try {
          final cameras = await availableCameras();
          if (cameras.isEmpty) return;

          final controller = CameraController(
            cameras.first,
            ResolutionPreset.high,
            enableAudio: false,
          );

          await controller.initialize();
          cameraController.value = controller;
          isCameraInitialized.value = true;
        } catch (e) {
          debugPrint('Error initializing camera: $e');
        }
      }

      initializeCamera();

      // NOTE: tutorialProviderの初期化を待つ
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(milliseconds: 300));
        final isCompleted =
            await ref.read(tutorialProvider.notifier).loadTutorialStatus();

        if (!isCompleted && !hasShownTutorial.value) {
          hasShownTutorial.value = true;
          if (!context.mounted) return;
          await TutorialModal.show(
            context: context,
            text:
                '''「空」は無数にある。\n人それぞれの空がある。\n\nそして、それらは一つにつながっている。\n\n一つの大きな世界と一緒に\nあなただけの空がここにはある。\n\nカメラボタンを押して\nあなたの空の写真を撮影してみよう！''',
          );
        }
      });

      return () {
        cameraController.value?.dispose();
      };
    }, []);

    Future<void> takePicture() async {
      if (cameraController.value == null ||
          !cameraController.value!.value.isInitialized) {
        return;
      }

      try {
        final image = await cameraController.value!.takePicture();

        if (context.mounted) {
          onPhotoTaken(image.path);
        }
      } catch (e) {
        debugPrint('Error taking picture: $e');
      }
    }

    // TODO: 白い背景を透けさせてユーザーの見ている空をわかりやすいように！ (CameraPreviewの上に半透明のwidget置くね)
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        icon: const Icon(LucideIcons.x),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const Text(
                  'Vasture Today\'s Sky.',
                  style: AppTextStyles.displaySmall,
                ),
                const Gap(36),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: isCameraInitialized.value &&
                                  cameraController.value != null
                              ? CameraPreview(cameraController.value!)
                              : const ShimmerContainer(),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 36),
                            child: SquareButton(
                              onTap: () {
                                loadingState.whileLoading(() async {
                                  await takePicture();
                                });
                              },
                              icon: const Icon(LucideIcons.camera),
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                const Gap(120)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
