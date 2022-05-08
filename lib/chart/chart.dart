import 'dart:math';

import 'package:experiments/chart/progress_chart.dart';
import 'package:flutter/material.dart';

class CanvasChart extends StatefulWidget {
  const CanvasChart({Key? key}) : super(key: key);

  @override
  _CanvasChartState createState() => _CanvasChartState();
}

final rng = Random();
const dayCount = 7;

class _CanvasChartState extends State<CanvasChart> {
  late List<Score> _scores;

  @override
  void initState() {
    super.initState();
    final scores = List<Score>.generate(dayCount, (index) {
      final y = rng.nextDouble() * 30.0;
      final d = DateTime.now().add(Duration(days: -dayCount + index));
      return Score(y, d);
    });

    setState(() {
      _scores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Canvas Chart'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: SizedBox(
            height: 150,
            child: ProgressChart(_scores),
          ),
        ),
      ),
    );
  }
}
