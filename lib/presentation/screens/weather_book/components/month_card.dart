import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vasture/presentation/components/button/bounced_animation_button.dart';
import '../../../utils/theme/app_text_styles.dart';

class MonthCard extends StatelessWidget {
  const MonthCard({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.onTap,
  });

  final String label;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BouncedAnimationButton(
      onTap: onTap,
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.9),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  label,
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
