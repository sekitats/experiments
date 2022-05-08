import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

import '../../app_level/constants/constants.dart';
import '../../app_level/widgets/desktop/sliver_scaffold.dart';
import '../widgets/grid_view.dart';

class OptionHome extends StatefulWidget {
  const OptionHome({Key? key}) : super(key: key);

  @override
  _OptionHomeState createState() => _OptionHomeState();
}

class _OptionHomeState extends State<OptionHome> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _nav = Navigator.of(context);

    return SliverScaffold(
      controller: _controller,
      // minHeight: 120.0,
      // maxHeight: 120.0,
      children: [
        // SearchBar(),
        // ValueListenableBuilder(
        //   builder: (_, Box<ArticleModel> model, child) => HomeGridView(
        //     children: _displayOptions(_nav);
        //   ),
        // )
        HomeGridView(
          children: _displayOptions(_nav),
        )
      ],
      // menu: TopNavBar(controller: _controller),
    );
  }

  List<Widget> _displayOptions(NavigatorState nav) {
    var _list = <Widget>[];
    var _count = OptionsModel.options().length;
    // var _count = OptionAndRoutes.options().length;

    for (var i = 0; i < _count; i++) {
      final _model = OptionsModel.options()[i];
      _list.add(
        GFCard(
          boxFit: BoxFit.cover,
          image: Image.network('https://i.picsum.photos/id/$i/200/300.jpg'),
          title: GFListTile(
            // avatar: const GFAvatar(
            //  backgroundImage: ('https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            // ),
            title: Text(
              _model.articleName,
              style: const TextStyle(fontSize: 24.0),
            ),
            subTitle: Text(
                '作成日: ${_model.createdAt.toString().substring(0, 10)} ${_model.status.name == 'wip' ? '🚧' : ''}'),
          ),
          content: Text(_model.articleContent),
          buttonBar: GFButtonBar(
            children: <Widget>[
              GFButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(_model.articleRoute);
                },
                text: 'Go',
              ),
              // GFButton(
              //   onPressed: () {},
              //   text: 'Cancel',
              // ),
            ],
          ),
        ),
      );
    }

    // for (var optionAndRoute in OptionAndRoutes.options.entries) {
    // print(optionAndRoute.key);
    // const title = Text(optionAndRoute.key.toString());

    // ElevatedButton(
    //   onPressed: () {
    //     print(optionAndRoute.key);
    //     Navigator.of(context).pushNamed(optionAndRoute.value);
    //     // nav.pushNamed('$optionAndRoute.value');  TODO: nav.pushNamed
    //   },
    //   child: Text(optionAndRoute.key.toString()),
    // ),
    // );
    // }
    // for (var i = 0; i < _count; i++) {
    // final _model = OptionAndRoutes.optionRoutes()[i];
    // _list.add(Text('$nav, $_model'));
    // }

    return _list;
  }

  // Widget _addToList(NavigationState nav, bool value, ArticlesModel _model) =>
  //   ParallaxButton(

  //   )
  // }
}
