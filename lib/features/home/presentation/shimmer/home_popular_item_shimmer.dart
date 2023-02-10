import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePopularItemShimmer extends StatelessWidget {
  const HomePopularItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              width: 256,
            ),
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade100,
          ),
          SizedBox(width: 20),
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              width: 256,
            ),
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade100,
          ),
          SizedBox(width: 20),
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              width: 256,
            ),
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade100,
          ),
        ],
      ),
    );
  }
}
