import 'package:flutter/material.dart';

class SliverScaffold extends StatelessWidget {
  const SliverScaffold({
    Key? key,
    required ScrollController controller,
    required List<Widget> children,
    // required Widget menu,
    Widget statusBarChild = const Placeholder(),
  })  : _controller = controller,
        _children = children,
        // _menu = menu,
        _statusBarChild = statusBarChild,
        super(key: key);

  final ScrollController _controller;
  final List<Widget> _children;
  // final Widget _menu;
  final Widget _statusBarChild;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (_, int index) => _statusBarChild,
        //     childCount: 1,
        //   ),
        // ),
        // SliverPersistentHeader(
        //   pinned: true,
        //   floating: true,
        //   delegate: _SliverDelegate(child: _menu),
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [..._children],
            ),
            childCount: 1,
          ),
        )
      ],
    );
  }
}
