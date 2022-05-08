import 'package:flutter/material.dart';

class SqfliteSample extends StatefulWidget {
  const SqfliteSample({Key? key}) : super(key: key);

  @override
  _SqfliteSampleState createState() => _SqfliteSampleState();
}

class _SqfliteSampleState extends State<SqfliteSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Http Sample'),
      ),
      body: Container(
        child: const Text('Http Sample'),
      ),
    );
  }
}
