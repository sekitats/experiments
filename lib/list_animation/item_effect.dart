import 'package:flutter/material.dart';
import 'list_bloc.dart';

class ItemEffect extends StatefulWidget {
  final int position;
  final Widget child;
  final Duration duration;
  const ItemEffect(
      {required this.position, required this.child, required this.duration});

  @override
  _ItemEffect createState() => _ItemEffect();
}

class _ItemEffect extends State<ItemEffect> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetFloat =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ListBloc().listenAnimation,
      initialData: -1,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.data! >= widget.position && snapshot.data! > -1) {
          _controller.forward();
        }
        return SlideTransition(
          position: _offsetFloat,
          child: widget.child,
        );
      },
    );
  }
}
