import 'package:crash_couse_advanced/models/calendar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'cal_repo_interface.dart';

class CalendarRepository implements CalRepoInterface {
  const CalendarRepository();
  
  @override
  Future<List<Calendar>> refreshCalendars() async {
    final response = await Supabase.instance.client
        .from('calendars')
        .select('id, name, color, background_slug, calendar_dates (date)')
        .execute();

    if (response.error != null) {
      throw (response.error.toString());
    }

    return response.data.map<Calendar>((e) => Calendar.fromJson(e)).toList();
  }
}
