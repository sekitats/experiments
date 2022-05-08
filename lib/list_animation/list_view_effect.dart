import 'package:flutter/material.dart';
import 'list_bloc.dart';
import 'item_effect.dart';

class ListViewEffect extends StatefulWidget {
  final Duration duration;
  final List<Widget> children;

  const ListViewEffect(
      {Key? key, required this.duration, required this.children})
      : super(key: key);

  @override
  _ListViewEffect createState() => _ListViewEffect();
}

class _ListViewEffect extends State<ListViewEffect> {
  late ListBloc _listBloc;

  @override
  void initState() {
    super.initState();
    _listBloc = ListBloc();
  }

  @override
  void dispose() {
    // _listBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listBloc.startAnimation(widget.children.length, widget.duration);

    return Scaffold(
      body: Container(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.children.length,
          itemBuilder: (context, position) {
            return ItemEffect(
              child: widget.children[position],
              duration: widget.duration,
              position: position,
            );
          },
        ),
      )),
    );
  }
}
