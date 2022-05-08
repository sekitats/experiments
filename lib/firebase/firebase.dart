import 'package:experiments/firebase/splash.dart';
import 'package:flutter/material.dart';

import 'initialize.dart';

class FirebaseSample extends StatefulWidget {
  const FirebaseSample({Key? key}) : super(key: key);

  @override
  _FirebaseSampleState createState() => _FirebaseSampleState();
}

class _FirebaseSampleState extends State<FirebaseSample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'かしかりメモ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'LAST RESORT!!!'),
      // home: const List(),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Initialize(),
        '/list': (BuildContext context) => [] as Widget,
        '/splash': (BuildContext context) => const Splash()
      },
    );
  }
}
