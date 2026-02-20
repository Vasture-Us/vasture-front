import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vasture/presentation/components/shimmer/flexible_shimmer_container.dart';
import '../../utils/theme/app_colors.dart';

class WeatherBookScreenShimmer extends StatelessWidget {
  const WeatherBookScreenShimmer({super.key});

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
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(80),

                    const Align(
                      alignment: Alignment.topRight,
                      child: FlexibleShimmerContainer(
                        width: 50,
                        height: 50,
                        radius: 20,
                      ),
                    ),

                    const FlexibleShimmerContainer(
                      width: 280,
                      height: 54,
                      radius: 20,
                    ),

                    const Gap(24),

                    ...List.generate(
                      3,
                      (_) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: FlexibleShimmerContainer(
                          width: MediaQuery.of(context).size.width - 48,
                          height: 200,
                          radius: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
