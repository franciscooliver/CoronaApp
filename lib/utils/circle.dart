import 'package:flutter/rendering.dart';

class Circle extends CustomPainter {
  final Color color;
  final Offset offset;
  final radiusC;
  Circle(this.color, this.offset, this.radiusC);

  @override
  void paint(Canvas canvas, Size size) {
    final center = offset;
    final radius = radiusC;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  
}