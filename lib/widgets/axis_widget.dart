import 'package:animations/painters/coordinate_system_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AxisWidget extends StatelessWidget {
  const AxisWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        child,
        CustomPaint(
          painter: CoordinateSystemPainter(),
        ),
      ],
    );
  }
}
