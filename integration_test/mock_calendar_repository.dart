import 'package:crash_couse_advanced/config/constants.dart';
import 'package:crash_couse_advanced/models/calendar.dart';
import 'package:crash_couse_advanced/repositories/cal_repo_interface.dart';

class MockCalendarRepository extends CalRepoInterface {
  List<Calendar> cals = [
    Calendar(
      id: 1,
      name: 'untitled1',
      colorHex: colors.first.hex,
      backgroundSlug: backgrounds.first,
    ),
    Calendar(
      id: 2,
      name: 'untitled2',
      colorHex: colors.last.hex,
      backgroundSlug: backgrounds.last,
    ),
  ];

  @override
  Future<List<Calendar>> refreshCalendars() async {
    return cals;
  }

  @override
  Future<void> deleteCalendar(Calendar cal) async {
    return;
  }

  @override
  Future<void> deleteDate(Calendar cal, DateTime date) async {
    return;
  }

  @override
  Future<void> saveCalendar(Calendar cal) async {
    return;
  }

  @override
  Future<void> saveDate(Calendar cal, DateTime date) async {
    return;
  }
}
