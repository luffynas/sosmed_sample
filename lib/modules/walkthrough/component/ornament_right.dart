import 'package:flutter/material.dart';

class OrnamentRightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.9981643);
    path_0.cubicTo(
        size.width * 0.3530278,
        size.height * 0.9162011,
        size.width * 0.7264167,
        size.height * 0.7961076,
        size.width,
        size.height * 0.7439858);
    path_0.lineTo(size.width, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff269BF0).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
