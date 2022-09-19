import 'package:crash_couse_advanced/screens/cal_pager/cal_pager.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../intro/intro.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends SupabaseAuthState<Splash> {
  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void onAuthenticated(Session session) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      CalPager.routeName,
      ModalRoute.withName(Splash.routeName),
    );
  }

  @override
  void onErrorAuthenticating(String message) {
    print('error authenticating $message');
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onUnauthenticated() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Intro.routeName,
      ModalRoute.withName(Splash.routeName),
    );
  }
}
