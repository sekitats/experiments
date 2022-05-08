import 'package:flutter/material.dart';
import '../../utilities/screen_size.dart';

class NavRail extends StatefulWidget {
  const NavRail({
    Key? key,
    required this.optionWidgets,
  }) : super(key: key);

  final List<Widget> optionWidgets;

  @override
  _NavRailState createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _width = ScreenQueries.instance.width(context) * 0.07;
    return Row(
      children: <Widget>[
        NavigationRail(
          minWidth: _width,
          backgroundColor: Colors.black,
          destinations: _createOptions,
          labelType: NavigationRailLabelType.all,
          onDestinationSelected: (int i) => _onOptionSelected(i),
          selectedIndex: _selectedIndex,
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedLabelTextStyle: const TextStyle(
              color: Colors
                  .grey), // Theme.of(context).textTheme.button.c(Colors.grey),
          selectedLabelTextStyle: const TextStyle(color: Colors.white),
        ),
        Expanded(child: widget.optionWidgets[_selectedIndex]),
      ],
    );
  }

  void _onOptionSelected(int i) {
    setState(() => _selectedIndex = i);
  }

  List<NavigationRailDestination> get _createOptions {
    final _options = [
      const NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text('Home'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.favorite_border),
        label: Text('Favorites'),
        selectedIcon: Icon(Icons.favorite),
      ),
      // const NavigationRailDestination(
      //   icon: Icon(Icons.mobile_friendly),
      //   label: Text('Mobile Links'),
      // ),
      // const NavigationRailDestination(
      //   icon: Icon(Icons.desktop_mac),
      //   label: Text('Desktop Links'),
      // ),
    ];
    return _options;
  }
}
