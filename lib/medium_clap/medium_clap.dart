import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MediumClap extends StatefulWidget {
  const MediumClap({Key? key}) : super(key: key);

  @override
  State<MediumClap> createState() => _MediumClapState();
}

enum ScoreWidgetStatus {
  hidden,
  visible,
  becomingVisible,
  becomingInvisible,
}

class _MediumClapState extends State<MediumClap> with TickerProviderStateMixin {
  int _counter = 0;
  late double _sparklesAngle = 0.0;
  final duration = const Duration(milliseconds: 300);
  late Random random;
  late AnimationController scoreInAnimationController,
      scoreOutAnimationController,
      scoreSizeAnimationController,
      sparklesAnimationController;
  late Animation<double> scoreOutPositionAnimation;
  ScoreWidgetStatus _scoreWidgetStatus = ScoreWidgetStatus.hidden;
  Timer? holdTimer;
  Timer? scoreOutETA;
  late Animation sparklesAnimation;

  @override
  void initState() {
    super.initState();
    random = Random();

    scoreInAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    scoreOutAnimationController = AnimationController(
      vsync: this,
      duration: duration,
    );

    scoreOutPositionAnimation = Tween(begin: 100.0, end: 150.0).animate(
      CurvedAnimation(
          parent: scoreOutAnimationController, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });
    scoreOutAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scoreWidgetStatus = ScoreWidgetStatus.hidden;
      }
    });

    scoreSizeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          scoreSizeAnimationController.reverse();
        }
      });

    sparklesAnimationController =
        AnimationController(vsync: this, duration: duration);
    sparklesAnimation = CurvedAnimation(
        parent: sparklesAnimationController, curve: Curves.easeIn);
    sparklesAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void increment(Timer? t) {
    scoreSizeAnimationController.forward(from: 0.0);
    sparklesAnimationController.forward(from: 0.0);
    setState(() {
      _counter++;
      _sparklesAngle = random.nextDouble() * (2 * pi);
    });
  }

  void onTapDown(TapDownDetails tap) {
    scoreOutETA?.cancel();
// We do not want the score to vanish!
    if (_scoreWidgetStatus == ScoreWidgetStatus.hidden) {
      scoreInAnimationController.forward(from: 0.0);
      _scoreWidgetStatus = ScoreWidgetStatus.becomingVisible;
    }
    increment(null); // Take care of tap
    holdTimer = Timer.periodic(duration, increment);
  }

  void onTapUp(TapUpDetails tap) {
    scoreOutETA = Timer(duration, () {
      scoreOutAnimationController.forward(from: 0.0);
      _scoreWidgetStatus = ScoreWidgetStatus.becomingInvisible;
    });
    holdTimer?.cancel();
  }

  Widget getScoreButton() {
    var scorePosition = 0.0;
    var scoreOpacity = 0.0;
    var extraSize = 0.0;
    switch (_scoreWidgetStatus) {
      case ScoreWidgetStatus.hidden:
        break;
      case ScoreWidgetStatus.becomingVisible:
        scorePosition = scoreInAnimationController.value * 100;
        scoreOpacity = scoreInAnimationController.value;
        extraSize = scoreSizeAnimationController.value * 10;
        break;
      case ScoreWidgetStatus.becomingInvisible:
        scorePosition = scoreOutAnimationController.value;
        scoreOpacity = 1.0 - scoreOutAnimationController.value;
        break;
      default:
        break;
    }
    var stackChildren = <Widget>[];

    var firstAngle = _sparklesAngle;
    var sparkleRadius = (sparklesAnimationController.value * 50);
    var sparklesOpacity = (1.0 - sparklesAnimation.value);

    for (int i = 0; i < 5; ++i) {
      var currentAngle = (firstAngle + ((2 * pi) / 5) * (i));
      var sparklesWidget = Positioned(
        child: Transform.rotate(
            angle: currentAngle - pi / 2,
            child: Opacity(
                opacity: sparklesOpacity,
                child: Image.asset(
                  "sparkles.png",
                  width: 14.0,
                  height: 14.0,
                ))),
        left: (sparkleRadius * cos(currentAngle)) + 20,
        top: (sparkleRadius * sin(currentAngle)) + 20,
      );
      stackChildren.add(sparklesWidget);
    }

    stackChildren.add(Opacity(
        opacity: scoreOpacity,
        child: Container(
            height: 50.0 + extraSize,
            width: 50.0 + extraSize,
            decoration: const ShapeDecoration(
              shape: CircleBorder(side: BorderSide.none),
              color: Colors.pink,
            ),
            child: Center(
                child: Text(
              "+" + _counter.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            )))));

    var widget = Positioned(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: FractionalOffset.center,
        children: stackChildren,
      ),
      bottom: scorePosition,
    );

    return widget;
  }

  Widget getClapButton() {
    var extraSize = 0.0;
    if (_scoreWidgetStatus == ScoreWidgetStatus.visible ||
        _scoreWidgetStatus == ScoreWidgetStatus.becomingInvisible) {
      extraSize = scoreSizeAnimationController.value * 10;
    }
    return GestureDetector(
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      child: Container(
        height: 60.0 + extraSize,
        width: 60.0 + extraSize,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.pink, width: 1.0),
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.pink, blurRadius: 8.0),
            ]),
        child: const ImageIcon(
          AssetImage("clap.png"),
          color: Colors.pink,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: FractionalOffset.center,
          children: <Widget>[
            getScoreButton(),
            getClapButton(),
          ],
        ),
      ),
    );
  }
}
