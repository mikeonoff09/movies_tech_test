import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookCardSkeleton extends StatelessWidget {
  const BookCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          height: 200,
          width: double.infinity,
        ),
      ),
    );
  }
}
