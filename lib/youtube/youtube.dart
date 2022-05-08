import 'package:flutter/material.dart';

class YoutubeSample extends StatefulWidget {
  const YoutubeSample({Key? key}) : super(key: key);

  @override
  State<YoutubeSample> createState() => _YoutubeSampleState();
}

class _YoutubeSampleState extends State<YoutubeSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const YoutubeSample(),
          ElevatedButton(
            child: const Text('hoge'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const Text('hogehoge');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
