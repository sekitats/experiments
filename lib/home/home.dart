import 'package:experiments/home/screens/option_home.dart';
import 'package:flutter/material.dart';

import '../app_level/widgets/desktop/nav_rail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff494d5f),
      body: NavRail(
        optionWidgets: <Widget>[
          OptionHome(),
          // OptionFav(),
          // OptionMobile(),
          // OptionDesktop(),
        ],
      ),
    );
  }
}
