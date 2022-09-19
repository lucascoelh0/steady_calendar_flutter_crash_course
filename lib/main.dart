import 'package:crash_couse_advanced/app.dart';
import 'package:crash_couse_advanced/screens/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'package:crash_couse_advanced/providers/session_provider.dart';

void main() async {
  runAppWithOptions(
    envFileName: '.env',
    splashState: SplashState(),
  );
}
