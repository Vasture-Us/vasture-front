import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vasture/presentation/components/shimmer/flexible_shimmer_container.dart';
import '../../utils/theme/app_colors.dart';

class PhotoDetailScreenShimmer extends StatelessWidget {
  const PhotoDetailScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            const Positioned(
              bottom: -20,
              right: -50,
              child: FlexibleShimmerContainer(
                width: 140,
                height: 120,
                radius: 60,
              ),
            ),
            Column(
              children: [
                const Gap(36),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    child: const FlexibleShimmerContainer(
                      width: double.infinity,
                      height: double.infinity,
                      radius: 48,
                    ),
                  ),
                ),

                const Gap(72),

                const Padding(
                  padding: EdgeInsets.only(left: 54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlexibleShimmerContainer(
                        width: 240,
                        height: 28,
                        radius: 12,
                      ),
                      Gap(28),
                      Row(
                        children: [
                          FlexibleShimmerContainer(
                            width: 80,
                            height: 48,
                            radius: 16,
                          ),
                          Gap(8),
                          FlexibleShimmerContainer(
                            width: 120,
                            height: 48,
                            radius: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Gap(72),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
