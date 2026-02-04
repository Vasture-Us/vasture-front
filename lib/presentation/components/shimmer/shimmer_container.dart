import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        color: Colors.grey[300]!,
      ),
    );
  }
}
