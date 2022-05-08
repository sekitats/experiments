import 'package:experiments/animation/animation.dart';
import 'package:experiments/canvas_art1/canvas_art1.dart';
import 'package:experiments/canvas_art2/canvas_art2.dart';
import 'package:experiments/chart/chart.dart';
import 'package:experiments/dio/dio.dart';
import 'package:experiments/list_animation/list_animation.dart';
import 'package:experiments/looper/looper.dart';
import 'package:experiments/medium_clap/medium_clap.dart';
import 'package:experiments/statefulW/statefulW.dart';
import 'package:experiments/tween_staggered/tween_staggered.dart';
import 'package:experiments/youtube/youtube.dart';
import 'package:experiments/admob/admob.dart';
import 'package:experiments/cupertino/cupertino.dart';
import 'package:experiments/firebase/firebase.dart';
import 'package:experiments/grid_view/grid_view.dart';
import 'package:experiments/home/home.dart';
import 'package:experiments/lifecycle/lifecycle.dart';
import 'package:experiments/sliver_app_bar/sliver_app_bar.dart';
import 'package:experiments/stream/stream.dart';
import '../../http/http.dart';
import '../constants/constants.dart';

import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppLevelConstants.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Home(),
          // name: AppLevelConstants.homeRoute,
        );
      case AppLevelConstants.gridView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const GridViewSample(),
        );
      case AppLevelConstants.sliverAppBar:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SliverAppBarSample(),
        );
      // case AppLevelConstants.reduxSample:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const ReduxSample(),
      //   );
      case AppLevelConstants.statefulW:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const StatefulWidgetSample(),
        );
      // case AppLevelConstants.provider:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const ProviderSample(),
      //   );
      case AppLevelConstants.cupertino:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Cupertino(),
        );
      case AppLevelConstants.firebase:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const FirebaseSample(),
        );
      // case AppLevelConstants.iamrich:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const IAmRich(),
      //   );
      // case AppLevelConstants.micard:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const MiCard(),
      //   );
      case AppLevelConstants.admob:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Admob(),
          // name: AppLevelConstants.admob,
        );
      case AppLevelConstants.lifecycle:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LifeCycle(),
        );
      case AppLevelConstants.tweenStaggered:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const TweenStaggered(),
        );
      case AppLevelConstants.art1:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CanvasArt1(),
        );
      case AppLevelConstants.chart:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CanvasChart(),
        );
      case AppLevelConstants.looper:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Looper(),
        );
      case AppLevelConstants.art2:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CanvasArt2(),
        );
      case AppLevelConstants.youtube:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const YoutubeSample(),
        );
      case AppLevelConstants.mediumClap:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MediumClap(),
        );
      case AppLevelConstants.animation:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AnimationSample(),
        );
      case AppLevelConstants.listAnimation:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ListAnimation(),
        );
      case AppLevelConstants.stream:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const StreamSample(),
        );
      case AppLevelConstants.piano:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Home(),
        );
      case AppLevelConstants.hive:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Home(),
        );
      case AppLevelConstants.dio:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const DioSample(),
        );
      case AppLevelConstants.sqflite:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SqfliteSample(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Home(),
          // name: AppLevelConstants.homeRoute,
        );
    }
  }
}
