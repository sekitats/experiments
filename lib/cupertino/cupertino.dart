import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'model/app_state_model.dart';

class Cupertino extends StatefulWidget {
  const Cupertino({Key? key}) : super(key: key);

  @override
  _CupertinoState createState() => _CupertinoState();
}

class _CupertinoState extends State<Cupertino> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      child: const CupertinoStoreApp(),
    );
  }
}
