import 'package:flutter/material.dart';

class VerticalDottedLinePainter extends CustomPainter {
  final double dotRadius;
  final double space;
  final Color color;

  VerticalDottedLinePainter({
    this.dotRadius = 2.0,
    this.space = 4.0,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    while (startY < size.height) {
      canvas.drawCircle(Offset(0, startY), dotRadius, paint);
      startY += dotRadius * 2 + space;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Model {
  final String address;
  final Color color;

  Model(this.address, this.color);
}
