import 'package:animations/clippers/half_circle_clipper.dart';
import 'package:animations/enums/circle_side_enum.dart';
import 'package:flutter/material.dart';

class CircleContainerWidget extends StatelessWidget {
  const CircleContainerWidget({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: double.infinity,
      maxHeight: size,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipPath(
            clipper: HalfCircleClipper(side: CircleSide.left),
            child: Container(
              height: size,
              width: size,
              decoration: const BoxDecoration(color: Colors.blue),
            ),
          ),
          ClipPath(
            clipper: HalfCircleClipper(side: CircleSide.right),
            child: Container(
              height: size,
              width: size,
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}
