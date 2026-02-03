import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vasture/presentation/components/animation/bounced_animation.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // TODO go to camera screen
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
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
            Gap(24),
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
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
