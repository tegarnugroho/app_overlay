import 'package:flutter/material.dart';
import 'dart:math';

class CirclePaint extends CustomPainter {
  final Color secondaryColor;
  final Color primaryColor;
  final double strokeWidth;

  double _degreeToRad(double degree) => degree * pi / 180;

  CirclePaint(
      {this.secondaryColor = Colors.grey,
      this.primaryColor = Colors.blue,
      this.strokeWidth = 15});

  @override
  void paint(Canvas canvas, Size size) {
    double centerPoint = size.height / 2;

    Paint paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [secondaryColor, primaryColor],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(
        Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));
// 1
    var scapSize = strokeWidth * 0.70;
    double scapToDegree = scapSize / centerPoint;
// 2
    double startAngle = _degreeToRad(270) + scapToDegree;
    double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(const Offset(0.0, 0.0) & Size(size.width, size.width),
        startAngle, sweepAngle, false, paint..color = primaryColor);
  }

  @override
  bool shouldRepaint(CirclePaint oldDelegate) {
    return true;
  }
}
