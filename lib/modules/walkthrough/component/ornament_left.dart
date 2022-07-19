import 'package:flutter/material.dart';

class OrnamentLeftPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.8188453);
    path_0.cubicTo(
        size.width * 0.2736111,
        size.height * 0.8291175,
        size.width * 0.6396944,
        size.height * 0.9228281,
        size.width,
        size.height * 0.9980831);
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
