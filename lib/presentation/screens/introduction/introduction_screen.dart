import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vasture/presentation/components/button/bounced_animation_button.dart';
import 'package:vasture/presentation/utils/theme/app_shadows.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_text_styles.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                const Gap(50),
                SvgPicture.asset(
                  'assets/icons/vasture_logo.svg',
                  width: 80,
                  height: 80,
                ),
                const Gap(120),
                BouncedAnimationButton(
                  onTap: () {
                    const CameraPageViewScreenRoute().go(context);
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [AppShadows.primary],
                    ),
                    child: const Icon(
                      LucideIcons.moveRight,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/shapes/intro_bottom_shape.svg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BouncedAnimationButton(
                onTap: () => _launchUrl('https://example.com/privacy'),
                child: Text(
                  'Privacy Policy',
                  style: AppTextStyles.titleMedium.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Gap(24),
              BouncedAnimationButton(
                onTap: () => _launchUrl('https://example.com/terms'),
                child: Text(
                  'Terms of Service',
                  style: AppTextStyles.titleMedium.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Gap(48)
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
