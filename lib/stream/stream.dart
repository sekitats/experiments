import 'package:flutter/material.dart';

import 'counter_logic.dart';

class StreamSample extends StatefulWidget {
  const StreamSample({Key? key}) : super(key: key);

  @override
  _StreamSampleState createState() => _StreamSampleState();
}

class _StreamSampleState extends State<StreamSample> {
  late CounterLogic counterLogic;

  @override
  void initState() {
    super.initState();
    counterLogic = CounterLogic();
  }

  @override
  void dispose() {
    counterLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Stream'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: counterLogic.value,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const Text('I am a widget that will not be rebuild'),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                counterLogic.incrementCounter();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
