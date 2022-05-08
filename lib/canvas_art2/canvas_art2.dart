import 'package:experiments/canvas_art2/my_painter.dart';
import 'package:flutter/material.dart';

class CanvasArt2 extends StatefulWidget {
  const CanvasArt2({Key? key}) : super(key: key);

  @override
  _CanvasArt2State createState() => _CanvasArt2State();
}

class _CanvasArt2State extends State<CanvasArt2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('CanvasArt2'),
        ),
        body: const MyPainter());
  }
}
