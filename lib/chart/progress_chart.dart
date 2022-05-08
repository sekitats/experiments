import 'package:flutter/material.dart';

import 'chart_painter.dart';

class Score {
  late double value;
  late DateTime time;
  Score(this.value, this.time);
}

class ProgressChart extends StatefulWidget {
  final List<Score> scores;
  const ProgressChart(this.scores);

  @override
  State<ProgressChart> createState() => _ProgressChartState();
}

const WeekDays = ["", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

class _ProgressChartState extends State<ProgressChart> {
  late double _min, _max;
  late List<double> _Y;
  late List<String> _X;

  @override
  void initState() {
    super.initState();
    var min = double.maxFinite;
    var max = -double.maxFinite;
    for (var p in widget.scores) {
      min = min > p.value ? p.value : min;
      max = max < p.value ? p.value : max;
    }

    setState(() {
      _min = min;
      _max = max;
      _Y = widget.scores.map((p) => p.value).toList();
      _X = widget.scores
          .map((p) => "${WeekDays[p.time.weekday]}\n${p.time.day}")
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(),
      painter: ChartPainter(_X, _Y, _min, _max),
    );
  }
}
