import 'package:animations/enums/circle_side_enum.dart';
import 'package:flutter/material.dart';

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();

    late final Offset offset;
    late final bool isClockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        isClockwise = false;
        break;

      case CircleSide.right:
        path.moveTo(0, 0);
        offset = Offset(0, size.height);
        isClockwise = true;
        break;
    }

    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: isClockwise,
    );

    path.close();

    return path;
  }
}
