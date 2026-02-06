import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vasture/presentation/components/shimmer/flexible_shimmer_container.dart';
import '../../utils/theme/app_colors.dart';

class WeatherScreenShimmer extends StatelessWidget {
  const WeatherScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            const Positioned(
              top: -10,
              left: -30,
              child: FlexibleShimmerContainer(
                width: 140,
                height: 120,
                radius: 60,
              ),
            ),
            Column(
              children: [
                const Gap(80),

                const Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FlexibleShimmerContainer(
                          width: 150,
                          height: 60,
                          radius: 20,
                        ),
                        Gap(8),
                        FlexibleShimmerContainer(
                          width: 180,
                          height: 60,
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                ),

                const Gap(32),

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

                const Gap(24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
