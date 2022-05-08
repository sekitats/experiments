import 'package:flutter/material.dart';
import 'list_view_effect.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({Key? key}) : super(key: key);

  @override
  _ListAnimation createState() => _ListAnimation();
}

class _ListAnimation extends State<ListAnimation> {
  final List<String> _list = [
    "John",
    "Paul",
    "George",
    "Ringo",
    "John",
    "Paul",
    "George",
    "Ringo"
  ].toList();

  final Duration _duration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: ListViewEffect(
          duration: _duration,
          children: _list.map((s) => _buildWidgetExample(s)).toList(),
        ),
      ),
    );
  }

  Widget _buildWidgetExample(String text) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
