import 'package:crash_couse_advanced/screens/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../providers/session_provider.dart';
import '../cal_pager/cal_pager.dart';
import '../intro/intro.dart';

class SplashState extends SupabaseAuthState<Splash> {
  SplashState();

  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  login() async {
    provider.Provider.of<SessionProvider>(context, listen: false)
        .refreshCalendars();

    Navigator.of(context).pushNamedAndRemoveUntil(
      CalPager.routeName,
      ModalRoute.withName(Splash.routeName),
    );
  }

  logout(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Intro.routeName,
      ModalRoute.withName(Splash.routeName),
    );
  }

  @override
  void onAuthenticated(Session session) => login();

  @override
  void onErrorAuthenticating(String message) {
    print('error authenticating $message');
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onUnauthenticated() => logout(context);
}
