import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list.dart';
import 'splash.dart';
import 'user_auth.dart';

class Initialize extends StatelessWidget {
  const Initialize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _mailLoginCheck(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('接続に失敗しました。');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return List();
            } else {
              return Splash();
            }
          }),
    );
  }

  Future _mailLoginCheck() async {
    if (userAuth.currentUser == null) {
      await userAuth.signInAnonymously();
    }
  }
}
