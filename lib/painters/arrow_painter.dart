import 'dart:math';

import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  final Offset begin;
  final Offset end;

  ArrowPainter({
    super.repaint,
    required this.begin,
    required this.end,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final shorterEnd = Offset(
      (end.dx - 4).clamp(0, double.infinity),
      (end.dy - 4).clamp(0, double.infinity),
    );

    canvas.drawLine(begin, shorterEnd, paint);

    final dX = end.dx - begin.dx;
    final dY = end.dy - begin.dy;
    final lineAngle = atan2(dY, dX);

    const arrowSize = 15;
    const arrowAngle = pi / 6;

    final path = Path();
    path.moveTo(
      end.dx - arrowSize * cos(lineAngle - arrowAngle),
      end.dy - arrowSize * sin(lineAngle - arrowAngle),
    );
    path.lineTo(end.dx, end.dy);
    path.lineTo(
      end.dx - arrowSize * cos(lineAngle + arrowAngle),
      end.dy - arrowSize * sin(lineAngle + arrowAngle),
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
