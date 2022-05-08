import 'package:flutter/material.dart';

class Looper extends StatefulWidget {
  const Looper({Key? key}) : super(key: key);

  @override
  State<Looper> createState() => _LooperState();
}

class _LooperState extends State<Looper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Looper'),
      ),
      body: Container(
        child: const Text('Looper'),
      ),
    );
  }
}
