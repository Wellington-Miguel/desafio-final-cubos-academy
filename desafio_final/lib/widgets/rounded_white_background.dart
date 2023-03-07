import 'package:flutter/material.dart';
import '../resources/colours.dart';

class RoundedWhiteBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path();
    path.moveTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 150);
    path.quadraticBezierTo(width * 0.5, 106, 0, 150);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = Colours.white;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}