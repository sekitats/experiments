import '../models/articles.dart';

class AppLevelConstants {
  AppLevelConstants._();

  static const String title = "FlutterWeb | sekitats";
  static const String homeRoute = "/";

  static const String title_key = 'title';
  static const String route_key = 'route';
  static const String content_key = 'content';
  static const String created_at_key = 'createdAt';
  static const String status = "status";

  static const String fontFamily = 'Montserrat';

  static const String option0 = 'Experiment'; // 5/2
  static const String option1 = 'Grid View'; // 2/20
  static const String option2 = 'Sliver AppBar'; // 2/20
  static const String option3 = 'Redux Sample'; // 2/30
  static const String option4 = 'Stateful Widget'; // 2/20
  static const String option5 = 'Provider'; // 2/20
  static const String option6 = 'Cupertino'; // 2/21
  static const String option7 = 'Firebase'; // 2/26
  // static const String option8 = 'I am Rich'; // 3/2
  static const String option9 = 'mi card'; // 3/5
  static const String option10 = 'Admob'; // 4/3
  static const String option11 = 'Lifecycle'; // 4/5
  static const String option12 = 'Tween Staggered'; // 4/9
  static const String option13 = 'Canvas Art Part1'; // 4/16
  static const String option14 = 'Chart'; // 4/17
  static const String option15 = 'Looper'; // 4/23
  static const String option16 = 'Canvas Art Part2'; // 4/23
  static const String option17 = 'YouTube'; // 4/24
  static const String option18 = 'Medium Clap'; // 4/29
  static const String option19 = 'Animation Controller'; // 4/30
  static const String option20 = 'List Animation'; // 4/30
  static const String option21 = 'Stream'; // 4/30
  static const String option22 = 'piano';
  static const String option23 = 'hive';
  static const String option24 = 'Dio Sample';
  static const String option25 = 'socketio';
  static const String option26 = 'Sqflite Sample';
  static const String option27 = '';

  static const String gridView = '/grid_view';
  static const String sliverAppBar = '/sliver_app_bar';
  static const String reduxSample = '/redux_sample';
  static const String statefulW = '/statefulW';
  static const String provider = '/provider';
  static const String cupertino = "/cupertino";
  static const String firebase = '/firebase';
  // static const String iamrich = '/iamrich';
  static const String micard = '/micard';
  static const String admob = "/admob";
  static const String lifecycle = "/lifecycle";
  static const String tweenStaggered = "/tween_staggered";
  static const String art1 = "/canvas_art1";
  static const String chart = "/chart";
  static const String looper = "/looper";
  static const String art2 = "/canvas_art2";
  static const String youtube = "/youtube";
  static const String mediumClap = "/medium_clap";
  static const String animation = "/animation";
  static const String listAnimation = "/list_animation";
  static const String stream = "/stream";
  static const String piano = "/piano";
  static const String hive = "/hive";
  static const String dio = "/dio";
  static const String sqflite = "/sqflite";
}

enum Status {
  wip,
  done,
}

class OptionAndRoutes {
  OptionAndRoutes._();

  static Map<String, Map<String, dynamic>> optionSummaries = {
    AppLevelConstants.option26: {
      AppLevelConstants.title_key: AppLevelConstants.option26,
      AppLevelConstants.route_key: AppLevelConstants.sqflite,
      AppLevelConstants.content_key:
          "Dart and Flutter: The Complete Developer's Guide のセクション18からセクション22。HTTP request, sqflite, provider",
      AppLevelConstants.status: Status.wip,
      AppLevelConstants.created_at_key: DateTime(2022, 2, 16),
    },
    AppLevelConstants.option1: {
      AppLevelConstants.title_key: AppLevelConstants.option1,
      AppLevelConstants.route_key: AppLevelConstants.gridView,
      AppLevelConstants.content_key:
          '『Flutter開発入門』の2章。GridView.builder、SliverGridDelegateWithFixedCrossAxisCount, scrollController',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 2, 20),
    },
    AppLevelConstants.option2: {
      AppLevelConstants.title_key: AppLevelConstants.option2,
      AppLevelConstants.route_key: AppLevelConstants.sliverAppBar,
      AppLevelConstants.content_key:
          '『Flutter開発入門』の2章。CustomScrollView, SliverAppBar, SliverList, SliverChildListDelegate, google_fonts',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 2, 20),
    },
    AppLevelConstants.option4: {
      AppLevelConstants.title_key: AppLevelConstants.option4,
      AppLevelConstants.route_key: AppLevelConstants.statefulW,
      AppLevelConstants.content_key: '『Flutter開発入門』の4章 状態管理。TodoAddDialog の作り方',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 2, 20),
    },
    // AppLevelConstants.option5: AppLevelConstants.provider,
    AppLevelConstants.option6: {
      AppLevelConstants.title_key: AppLevelConstants.option6,
      AppLevelConstants.route_key: AppLevelConstants.cupertino,
      AppLevelConstants.content_key: 'Building a Cupertino app with Flutter',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 2, 21),
    },
    AppLevelConstants.option7: {
      AppLevelConstants.title_key: AppLevelConstants.option7,
      AppLevelConstants.route_key: AppLevelConstants.firebase,
      AppLevelConstants.content_key:
          '『Flutter×Firebaseで始めるモバイルアプリ開発』firebase のCRUDとAuth。webでは動かない。',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 2, 13),
    },
    // AppLevelConstants.option8: AppLevelConstants.iamrich,
    // AppLevelConstants.option9: {
    //   AppLevelConstants.title_key: AppLevelConstants.option9,
    //   AppLevelConstants.route_key: AppLevelConstants.micard,
    //   AppLevelConstants.content_key:
    //       'Udemy The Complete 2021 Flutter Development Bootcamp with Dart By Dr. Angela Yu. google_fonts',
    //   AppLevelConstants.status: Status.done,
    //   AppLevelConstants.created_at_key: DateTime(2022, 3, 5),
    // },
    AppLevelConstants.option10: {
      AppLevelConstants.title_key: AppLevelConstants.option10,
      AppLevelConstants.route_key: AppLevelConstants.admob,
      AppLevelConstants.content_key: 'Adding AdMob ads to a Flutter app',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 3),
    },
    // AppLevelConstants.option11: AppLevelConstants.lifecycle,
    AppLevelConstants.option12: {
      AppLevelConstants.title_key: AppLevelConstants.option12,
      AppLevelConstants.route_key: AppLevelConstants.tweenStaggered,
      AppLevelConstants.content_key: '『Flutter開発入門』の3章 Tween Animation',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 9),
    },
    AppLevelConstants.option13: {
      AppLevelConstants.title_key: AppLevelConstants.option13,
      AppLevelConstants.route_key: AppLevelConstants.art1,
      AppLevelConstants.content_key: 'Youtube Coding with Indy Canvas Art 1',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 16),
    },
    AppLevelConstants.option14: {
      AppLevelConstants.title_key: AppLevelConstants.option14,
      AppLevelConstants.route_key: AppLevelConstants.chart,
      AppLevelConstants.content_key: 'Youtube Coding with Indy Canvas Chart',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 17),
    },
    AppLevelConstants.option16: {
      AppLevelConstants.title_key: AppLevelConstants.option16,
      AppLevelConstants.route_key: AppLevelConstants.art2,
      AppLevelConstants.content_key: 'Youtube Coding with Indy Canvas Art 1',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 23),
    },
    AppLevelConstants.option24: {
      AppLevelConstants.title_key: AppLevelConstants.option24,
      AppLevelConstants.route_key: AppLevelConstants.dio,
      AppLevelConstants.content_key:
          'Dio Http request flutter API request | News app',
      AppLevelConstants.status: Status.wip,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 23),
    },
    // AppLevelConstants.option17: AppLevelConstants.youtube,
    AppLevelConstants.option18: {
      AppLevelConstants.title_key: AppLevelConstants.option18,
      AppLevelConstants.route_key: AppLevelConstants.mediumClap,
      AppLevelConstants.content_key:
          'Creating medium’s clap animation in flutter',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 29),
    },
    AppLevelConstants.option19: {
      AppLevelConstants.title_key: AppLevelConstants.option19,
      AppLevelConstants.route_key: AppLevelConstants.animation,
      AppLevelConstants.content_key: '『Flutter開発入門』の3章 Animation controller',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 30),
    },
    AppLevelConstants.option20: {
      AppLevelConstants.title_key: AppLevelConstants.option20,
      AppLevelConstants.route_key: AppLevelConstants.listAnimation,
      AppLevelConstants.content_key: 'Medium ListView Animation in Flutter',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 30),
    },
    AppLevelConstants.option21: {
      AppLevelConstants.title_key: AppLevelConstants.option21,
      AppLevelConstants.route_key: AppLevelConstants.stream,
      AppLevelConstants.content_key:
          '『基礎から学ぶFlutter』7章アーキテクチャ、「StreamBuilder」を使ったサンプル',
      AppLevelConstants.status: Status.done,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 30),
    },
    AppLevelConstants.option0: {
      AppLevelConstants.title_key: AppLevelConstants.option0,
      AppLevelConstants.route_key: AppLevelConstants.homeRoute,
      AppLevelConstants.content_key:
          'AseemWangoo/experiments_with_webを参考にしている。NavRail',
      AppLevelConstants.status: Status.wip,
      AppLevelConstants.created_at_key: DateTime(2022, 5, 3),
    },
    AppLevelConstants.option22: {
      AppLevelConstants.title_key: AppLevelConstants.option22,
      AppLevelConstants.route_key: AppLevelConstants.piano,
      AppLevelConstants.content_key: '',
      AppLevelConstants.status: Status.wip,
      AppLevelConstants.created_at_key: DateTime(2022, 5, 3),
    },
    AppLevelConstants.option23: {
      AppLevelConstants.title_key: AppLevelConstants.option23,
      AppLevelConstants.route_key: AppLevelConstants.hive,
      AppLevelConstants.content_key: '',
      AppLevelConstants.status: Status.wip,
      AppLevelConstants.created_at_key: DateTime(2022, 5, 3),
    },
    AppLevelConstants.option17: {
      AppLevelConstants.title_key: AppLevelConstants.option17,
      AppLevelConstants.route_key: AppLevelConstants.youtube,
      AppLevelConstants.content_key: '',
      AppLevelConstants.status: Status.wip,
      AppLevelConstants.created_at_key: DateTime(2022, 4, 23),
    }
  };
}

class OptionsModel {
  OptionsModel._();

  static List<ArticlesModel> options() {
    var _articleModelList = <ArticlesModel>[];

    final Map<String, dynamic> _summaries = OptionAndRoutes.optionSummaries;

    for (var _summary in _summaries.entries) {
      final _articleModel = ArticlesModel(
        articleId: _summary.key.toString(),
        articleName: _summary.value['title'],
        articleRoute: _summary.value['route'],
        articleContent: _summary.value['content'],
        status: _summary.value['status'],
        createdAt: _summary.value['createdAt'], // _summaries[_optionRoute.key]
      );
      _articleModelList.add(_articleModel);
    }
    return _articleModelList;
  }
}
