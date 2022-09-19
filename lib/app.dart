import 'package:crash_couse_advanced/providers/session_provider.dart';
import 'package:crash_couse_advanced/repositories/cal_repo.dart';
import 'package:crash_couse_advanced/repositories/cal_repo_interface.dart';
import 'package:crash_couse_advanced/screens/cal_pager/cal_pager.dart';
import 'package:crash_couse_advanced/screens/login_options/login_options.dart';
import 'package:crash_couse_advanced/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/intro/intro.dart';

class App extends StatelessWidget {
  final State<Splash> splashState;

  const App(this.splashState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => Splash(splashState),
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
        CalPager.routeName: (context) => const CalPager(),
      },
    );
  }
}

Future<void> runAppWithOptions({
  String envFileName = '.env',
  CalRepoInterface calendarRepository = const CalendarRepository(),
  required State<Splash> splashState
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: 'https://${dotenv.env['SUPABASE_PROJECT_ID']!}.supabase.co',
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    debug: false,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => SessionProvider(calendarRepository),
      child: App(splashState),
    ),
  );
}
