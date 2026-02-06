import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FlexibleShimmerContainer extends StatelessWidget {
  const FlexibleShimmerContainer({
    super.key,
    required this.width,
    required this.height,
    this.radius = 8.0,
  });

  final double width;
  final double height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: SizedBox(
        width: width,
        height: height,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[200]!,
          child: Container(
            color: Colors.grey[300]!,
          ),
        ),
      ),
    );
  }
}
