import 'dart:math';

import 'package:flutter/material.dart';

import 'particle.dart';

class MyPainterCanvas extends CustomPainter {
  late List<Particle> particles;
  late Random rgn;
  MyPainterCanvas(this.rgn, this.particles);

  @override
  void paint(Canvas canvas, Size size) {
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
