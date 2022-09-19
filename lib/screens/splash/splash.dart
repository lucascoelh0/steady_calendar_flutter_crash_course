import 'package:crash_couse_advanced/screens/cal_pager/cal_pager.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../providers/session_provider.dart';
import '../intro/intro.dart';
import 'package:provider/provider.dart' as provider;

class Splash extends StatefulWidget {
  static const routeName = '/';

  final State<Splash> state;

  const Splash(this.state, {Key? key}) : super(key: key);

  @override
  State<Splash> createState() => state;
}
