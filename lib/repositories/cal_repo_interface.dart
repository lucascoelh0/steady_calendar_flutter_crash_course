import 'package:crash_couse_advanced/models/calendar.dart';

abstract class CalRepoInterface {
  Future<List<Calendar>> refreshCalendars();
}
