import 'package:flutter/material.dart';
import 'dart:math' as math;

class GridViewSample extends StatefulWidget {
  const GridViewSample({Key? key}) : super(key: key);

  @override
  _GridViewSampleState createState() => _GridViewSampleState();
}

class _GridViewSampleState extends State<GridViewSample> {
  int _columnsCount = 5;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String title =
        '${_scrollController.hasClients ? _scrollController.position.pixels.toInt().toString() : 0} pixels';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title),
      ),
      body: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _columnsCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final gridItemColor =
              Color((math.Random(index).nextDouble() * 0x00FFFFFF).toInt())
                  .withOpacity(1);
          final gridItemBrightness = gridItemColor.computeLuminance();
          return Stack(
            children: [
              Container(
                color: gridItemColor,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      fontSize: 43,
                      color: gridItemBrightness > 0.5
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Text(
                  gridItemColor
                      .toString()
                      .toUpperCase()
                      .substring(6, 16)
                      .replaceAll('0X', '#'),
                  style: TextStyle(
                      fontSize: 18,
                      color: gridItemBrightness > 0.5
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'grid_on',
            onPressed: () {
              if (_columnsCount < 10) {
                setState(() {
                  _columnsCount++;
                });
              }
            },
            child: const Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'grid_off',
            onPressed: () {
              setState(() {
                print(_columnsCount);

                if (_columnsCount > 2) {
                  _columnsCount--;
                }
              });
            },
            child: const Icon(
              Icons.grid_off,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'arrow_upward',
            onPressed: () {
              _scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInQuint);
            },
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
