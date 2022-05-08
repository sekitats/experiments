import 'dart:math';

import 'package:flutter/material.dart';

import 'my_painter_canvas.dart';
import 'particle.dart';

Offset polarToCartesian(double radius, double theta) {
  var x = radius * cos(theta);
  var y = radius * sin(theta);
  return Offset(x, y);
}

class MyPainter extends StatefulWidget {
  const MyPainter({Key? key}) : super(key: key);

  @override
  State<MyPainter> createState() => _MyPainterState();
}

double maxRadius = 4;
double maxSpeed = 0.2;
double maxTheta = 2.0 * pi; // 度数法の　360°　は弧度法では　2π (円周の長さ)

class _MyPainterState extends State<MyPainter>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  late List<Particle> particles = [];
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
        // setState(() { });
        if (particles.isEmpty) {
          createBlobField();
        } else {
          // update
          setState(() {
            updateBlobField();
          });
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();

    // particles = List<Particle>.generate(10000, (index) {
    //   var p = Particle()
    //     ..id = index
    //     ..color = getRandomColor(rgn)
    //     ..position = const Offset(-1, -1)
    //     ..speed = rgn.nextDouble() * maxSpeed
    //     ..theta = rgn.nextDouble() * maxTheta
    //     ..radius = rgn.nextDouble() * maxRadius;
    //   return p;
    // });
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
        child: Container(),
        painter: MyPainterCanvas(rgn, particles),
      ),
    );
  }

  void createBlobField() {
    // get the size of the screen
    final size = MediaQuery.of(context).size;
    // center of the screen
    final o = Offset(size.width / 2, size.height / 2);
    // number of blobs
    const n = 4;
    // radius
    final r = size.width * 2 / n;
    // alpha blending value
    const a = 0.2;
    blobField(r, n, a, o);
  }

  void blobField(double r, int n, double a, Offset o) {
    if (r < 10) return;

    /// the first thing to do   is to draw a circle
    particles.add(Particle()
      ..radius = r / n
      ..position = o
      ..origin = o
      ..color = Colors.black);
    // add orbital blobs

    var theta = 0.0;
    var dTheta = 2 * pi / n;
    for (var i = 0; i < n; i++) {
      var pos = polarToCartesian(r, theta) + o;
      particles.add(Particle()
        ..theta = theta
        ..radius = r / 3
        ..position = pos
        ..origin = o
        ..color = getColor(i.toDouble() / n, a));
      theta += dTheta;
      var f = 0.43;
      blobField(r * f, n, a * 1.5, pos);
    }
  }

  double t = 0;
  double dt = 0.01;
  double radiusFactor = 10;
  void updateBlobField() {
    t += dt;
    // move the particles around in its orbit
    for (var p in particles) {
      p.position =
          polarToCartesian(p.radius * radiusFactor, p.theta + t) + p.origin;
    }
  }

  Color getColor(double d, double a) {
    const a = 255;
    final r = ((sin(d * 2 * pi) * 127.0 + 127.0)).toInt();
    final g = ((cos(d * 2 * pi) * 127.0 + 127.0)).toInt();
    final b = rgn.nextInt(255);
    return Color.fromARGB(a, r, g, b);
  }
}
