import 'package:flutter/material.dart';

class OrnamentMidlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9987839, 0);
    path_0.lineTo(size.width * 0.001552762, 0);
    path_0.lineTo(size.width * 0.001552762, size.height * 0.9411509);
    path_0.cubicTo(
        size.width * 0.2167327,
        size.height * 0.9785849,
        size.width * 0.4245180,
        size.height * 1.004844,
        size.width * 0.6031884,
        size.height * 0.9992318);
    path_0.cubicTo(
        size.width * 0.7236316,
        size.height * 0.9954447,
        size.width * 0.8582299,
        size.height * 0.9769542,
        size.width * 0.9987839,
        size.height * 0.9504798);
    path_0.lineTo(size.width * 0.9987839, 0);
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
