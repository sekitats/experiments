import 'package:flutter/material.dart';

class ProviderSample extends StatefulWidget {
  const ProviderSample({Key? key}) : super(key: key);

  @override
  State<ProviderSample> createState() => _ProviderSampleState();
}

class _ProviderSampleState extends State<ProviderSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Provider'),
      ),
      body: Container(
        child: const Text('Provider'),
      ),
    );
  }
}
