import 'package:flutter/material.dart';

class IAmRich extends StatefulWidget {
  const IAmRich({Key? key}) : super(key: key);

  @override
  _IAmRichState createState() => _IAmRichState();
}

class _IAmRichState extends State<IAmRich> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('I am Rich'),
      ),
      body: Container(
        child: const Text('I am Rich'),
      ),
    );
  }
}
