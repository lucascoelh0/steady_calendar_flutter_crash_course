import 'package:crash_couse_advanced/screens/cal_pager/cal_pager.dart';
import 'package:crash_couse_advanced/screens/login_options/login_options.dart';
import 'package:crash_couse_advanced/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'screens/intro/intro.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
        CalPager.routeName: (context) => const CalPager(),
      },
    );
  }
}
