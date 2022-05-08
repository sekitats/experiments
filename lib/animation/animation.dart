import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';

class AnimationSample extends StatefulWidget {
  const AnimationSample({Key? key}) : super(key: key);

  @override
  _AnimationSampleState createState() => _AnimationSampleState();
}

class _AnimationSampleState extends State<AnimationSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController; // 宣言

  /// AnimationController の主要メソッド
  ///
  /// 1. forward
  /// 2. reverse
  /// 3. stop
  /// 4. reset
  /// 5. repeat
  /// 6. addListener
  ///

  int _seconds = 15;
  double _value = 0;

  @override
  void initState() {
    super.initState();
    // 宣言とインスタンス化は同時にできない。
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    ); // インスタンス化

    _animationController.addListener(() {
      setState(() {
        _value = _animationController.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // インスタンスを破棄
    super.dispose();
  }

  void _updateSeconds(int newSeconds) {
    // ラジオボタンが押されたことをUIに反映 → build が走る
    setState(() {});
    _seconds = newSeconds;
    _animationController.duration = Duration(seconds: _seconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('_animationController.value = ',
                style: TextStyle(
                  fontSize: 22,
                )),
            Text(
              _value.toStringAsFixed(2),
              style: const TextStyle(fontSize: 64, fontFeatures: [
                FontFeature.tabularFigures(),
              ]),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                width: 130,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[300],
                      onPrimary: Colors.black,
                    ),
                    onPressed: _animationController.forward,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Icon(Icons.play_arrow), Text('再生')],
                    ))),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: _animationController.reverse,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: math.pi,
                      child: const Icon(Icons.play_arrow),
                    ),
                    const Text('逆再生'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: _animationController.stop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: math.pi,
                      child: const Icon(Icons.pause),
                    ),
                    const Text('一時停止'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: _animationController.reset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.stop),
                    Text('停止'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                ),
                onPressed: _animationController.repeat,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.repeat),
                    Text('リピート'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              'Duration',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  value: _animationController.value,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(
                  width: 20,
                ),
                Radio<int>(
                  value: 15,
                  groupValue: _seconds,
                  onChanged: (int? newValue) {
                    _updateSeconds(newValue!);
                  },
                ),
                const Text('15秒'),
                Radio<int>(
                  value: 30,
                  groupValue: _seconds,
                  onChanged: (int? newValue) {
                    _updateSeconds(newValue!);
                  },
                ),
                const Text('30秒'),
                Radio<int>(
                  value: 60,
                  groupValue: _seconds,
                  onChanged: (int? newValue) {
                    _updateSeconds(newValue!);
                  },
                ),
                const Text('60秒'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
