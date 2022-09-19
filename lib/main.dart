import 'package:crash_couse_advanced/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: 'https://${dotenv.env['SUPABASE_PROJECT_ID']!}.supabase.co',
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    debug: false,
  );

  runApp(const App());
}
