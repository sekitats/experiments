import 'package:flutter/material.dart';
import 'dart:math';
import 'particle.dart';

Offset PolarToCartesian(double speed, double theta) {
  return Offset(speed * cos(theta), speed * sin(theta));
}

class MyPainterCanvas extends CustomPainter {
  List<Particle> particles;
  Random rgn;
  double animValue;
  MyPainterCanvas(this.rgn, this.particles, this.animValue);
  @override
  void paint(Canvas canvas, Size size) {
    double dx;
    double dy;
    particles.forEach((p) {
      var velocity = PolarToCartesian(p.speed, p.theta);

      dx = p.position.dx + velocity.dx;
      dy = p.position.dy + velocity.dy;
      if (p.position.dx < 0 || p.position.dx > size.width) {
        dx = rgn.nextDouble() * size.width;
        // print(p.id);
      }
      if (p.position.dy < 0 || p.position.dy > size.height) {
        dy = rgn.nextDouble() * size.height;
      }
      p.position = Offset(dx, dy);
    });

    // paint the objects
    // dx = size.width / 2;
    // dy = size.height / 2;
    // Offset c = Offset(dx, dy);
    // var radius = 100.0;
    // Paint paint = Paint()..color = Colors.red;
    // canvas.drawCircle(c, radius, paint);
    particles.forEach((p) {
      var paint = Paint()..color = p.color;
      canvas.drawCircle(p.position, p.radius, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
