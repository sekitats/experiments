import 'dart:math';
import 'package:flutter/material.dart';

import 'my_painter_canvas.dart';
import 'particle.dart';

class CanvasArt1 extends StatefulWidget {
  const CanvasArt1({Key? key}) : super(key: key);

  @override
  State<CanvasArt1> createState() => _CanvasArt1State();
}

double maxRadius = 5;
double maxSpeed = 0.7;
double maxTheta = 2.0 * pi; // 度数法の　360°　は弧度法では　2π (円周の長さ)

class _CanvasArt1State extends State<CanvasArt1>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  late List<Particle> particles;
  Random rgn = Random(DateTime.now().millisecondsSinceEpoch);

  Color getRandomColor(rgn) {
    var a = rgn.nextInt(255);
    var r = rgn.nextInt(255);
    var g = rgn.nextInt(255);
    var b = rgn.nextInt(255);
    return Color.fromARGB(a, r, g, b);
  }

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();

    particles = List<Particle>.generate(5000, (index) {
      var p = Particle()
        ..id = index
        ..color = getRandomColor(rgn)
        ..position = const Offset(-1, -1)
        ..speed = rgn.nextDouble() * maxSpeed
        ..theta = rgn.nextDouble() * maxTheta
        ..radius = rgn.nextDouble() * maxRadius;
      return p;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: MyPainterCanvas(rgn, particles, animation.value),
      // child: Container(color: Colors.yellow),
      child: Container(),
    ));
  }
}
