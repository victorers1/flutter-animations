import 'package:animations/enums/circle_side_enum.dart';
import 'package:animations/extensions/circle_side_extensions.dart';
import 'package:flutter/material.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircleClipper({super.reclip, required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
