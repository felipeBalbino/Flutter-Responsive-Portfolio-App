import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var scl = 6;
    var rectWidth = size.width / scl;

    for (int i = 0; i < scl; i++) {
      canvas.drawRect(
          Rect.fromLTWH(i * rectWidth, 0, rectWidth, size.height),
          Paint()
            ..color = i % 2 == 0 ? Colors.white54 : Colors.white54
            ..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
