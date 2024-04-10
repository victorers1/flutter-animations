import 'package:flutter/material.dart';

import 'package:animations/painters/arrow_painter.dart';

class CoordinateSystemPainter extends CustomPainter {
  CoordinateSystemPainter({
    super.repaint,
  });

  final axisLabelTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 12,
  );

  @override
  void paint(Canvas canvas, Size size) {
    drawYAxis(size, canvas);

    drawXAxis(size, canvas);

    drawXAxisLabel(size, canvas);

    drawYAxisLabel(size, canvas);
  }

  void drawXAxis(Size size, Canvas canvas) {
    const xAxisBegin = Offset(0, 0);
    final xAxisEnd = Offset(size.width, 0);
    final xAxisPainter = ArrowPainter(begin: xAxisBegin, end: xAxisEnd);
    xAxisPainter.paint(canvas, size);
  }

  void drawYAxis(Size size, Canvas canvas) {
    const yAxisBegin = Offset(0, 0);
    final yAxisEnd = Offset(0, size.height);
    final yAxisPainter = ArrowPainter(begin: yAxisBegin, end: yAxisEnd);
    yAxisPainter.paint(canvas, size);
  }

  void drawXAxisLabel(Size size, Canvas canvas) {
    final xAxisTextPainter = TextPainter(
      text: TextSpan(text: 'x', style: axisLabelTextStyle),
      textDirection: TextDirection.ltr,
    );
    final xAxisLabelOffset = Offset(size.width - 10, 10);
    xAxisTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    xAxisTextPainter.paint(canvas, xAxisLabelOffset);
  }

  void drawYAxisLabel(Size size, Canvas canvas) {
    final yAxisTextPainter = TextPainter(
      text: TextSpan(text: 'y', style: axisLabelTextStyle),
      textDirection: TextDirection.ltr,
    );
    final yAxisLabelOffset = Offset(10, size.height - 10);
    yAxisTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    yAxisTextPainter.paint(canvas, yAxisLabelOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
