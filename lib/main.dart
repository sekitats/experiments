import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_level/constants/constants.dart';
import 'app_level/routes/router.dart' as route;
import 'app_level/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.Router.generateRoute,
      theme: AppTheme.lightTheme,
      initialRoute: AppLevelConstants.homeRoute,
      title: AppLevelConstants.title,
    );
  }
}
