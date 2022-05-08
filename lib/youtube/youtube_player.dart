import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'debounce.dart';

class YoutubeSample extends StatefulWidget {
  const YoutubeSample({Key? key}) : super(key: key);

  @override
  State<YoutubeSample> createState() => _YoutubeSampleState();
}

class _YoutubeSampleState extends State<YoutubeSample> {
  late YoutubePlayerController controller;
  late double start = 0;
  late double end = 100;
  late double min = 0;
  late double max;
  late double playbackSpeed;
  bool _isLoaded = false;
  // ignore: prefer_const_constructors
  late RangeValues values = RangeValues(0, 1);
  // ignore: prefer_const_constructors, prefer_final_fields
  late RangeLabels _labels = RangeLabels('0', '0');

  static const url = 'https://www.youtube.com/watch?v=u9NAduREWjU';
  final debounce = Debounce(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
        hideControls: false,
        // startAt: 100,
        // endAt: 110,
      ),
    )

      // playbackSpeed = controller.value.playbackRate;
      // end = controller.metadata.duration.inSeconds;
      ..addListener(() {
        if (mounted) {
          if (controller.value.isReady &&
              controller.metadata.duration.inSeconds > 0 &&
              !_isLoaded) {
            start = 0;
            end = controller.metadata.duration.inSeconds.toDouble();
            max = end;
            playbackSpeed = controller.value.playbackRate;
            values = RangeValues(start, end);
            _isLoaded = true;
          }

          if (controller.value.position > Duration(seconds: end.toInt())) {
            // controller.pause();
            print('positionが ${controller.value.position}');
            print('end ${end.toInt()}');
            values = RangeValues(start.toDouble(), end.toDouble());
            controller.seekTo(Duration(seconds: start.toInt()));
            // controller.play();
            // controller.mute();
            // controller.setPlaybackRate(0.50);
          }
          // if (Duration(seconds: end) < controller.value.position) {
          //   controller.reset();
          //   controller.seekTo(const Duration(seconds: 10));
          // }
          setState(() {});
        }
      });
  }

  @override
  void deactivate() {
    controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateRangeSlider(newRange) {
    if (controller.value.isPlaying) {
      controller.pause();
    }
    print(newRange);
    final _start = newRange.start;
    final _end = newRange.end;
    final newLabels = RangeLabels(
      _start.toInt().toString(),
      _end.round().toString(),
    );
    start = _start.round().toDouble();
    end = _end.round().toDouble();
    debounce.run(() {});
    // controller.seekTo(Duration(seconds: start.toInt()));
    // start を更新したとき、end がmax
    // end を更新したとき start がmin になる
    // print(controller.value.position);

    setState(() {
      start = start;
      end = end;
      values = newRange;
      _labels = newLabels;
    });
  }

  @override
  Widget build(BuildContext context) {
    // controller.metadata.duration.inSeconds.toDouble();
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(title: const Text('Youtube Player')),
        body: Column(
          children: [
            player,
            Text(controller.metadata.title),
            const SizedBox(height: 8),
            Text(controller.metadata.author),
            const SizedBox(height: 8),
            Text('${controller.metadata.duration.inSeconds} seconds'),
            const SizedBox(height: 16),
            Text(start.toString()),
            const SizedBox(height: 8),
            Text(end.toString()),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  const url =
                      'https://www.youtube.com/watch?v=IJ0kurZy1DE&t=100';
                  // const url2 = "https://youtu.be/rFDbyepTDt4?t=253";
                  controller.load(YoutubePlayer.convertUrlToId(url)!);
                },
                child: const Text('Next Video')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  controller.toggleFullScreenMode();
                },
                child: const Text('Full Screen')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.seekTo(Duration(seconds: start.toInt()));
                  }
                },
                child: Text(controller.value.isPlaying ? 'Pause' : 'Play')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  // controller.mute();
                  // controller.unMute();
                  controller.seekTo(const Duration(seconds: 10));
                  start = 10.0;
                  values = RangeValues(start, end);
                  // controller.reset();
                },
                child: const Text('More...')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  // controller.mute();
                  // controller.unMute();
                  // controller.pause();
                  print('$start $end');
                  controller.seekTo(Duration(seconds: start.toInt()));
                  print('$start $end');

                  // controller.reset();
                },
                child: const Text('reset')),
            const SizedBox(height: 16),
            if (_isLoaded)
              Center(
                child: RangeSlider(
                  min: 0,
                  max: max,
                  labels: _labels,
                  values: values,
                  onChanged: _updateRangeSlider,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
