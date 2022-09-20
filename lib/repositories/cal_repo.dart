import 'package:crash_couse_advanced/models/calendar.dart';
import 'package:crash_couse_advanced/models/calendar_date.dart';
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

  @override
  Future<void> saveCalendar(Calendar cal) async {
    _assignUserId(cal);

    PostgrestResponse resp;
    if (cal.id == null) {
      // create
      resp = await Supabase.instance.client
          .from('calendars')
          .insert(cal)
          .execute();
    } else {
      // update
      resp = await Supabase.instance.client
          .from('calendars')
          .update({
            'name': cal.name,
            'color': cal.colorHex,
            'background_slug': cal.backgroundSlug,
          })
          .eq('id', cal.id)
          .execute();
    }

    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  @override
  Future<void> deleteCalendar(Calendar cal) async {
    _assignUserId(cal);

    final resp = await Supabase.instance.client
        .from('calendars')
        .delete()
        .eq('id', cal.id)
        .execute();
    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  @override
  Future<void> saveDate(Calendar cal, DateTime date) async {
    _assignUserId(cal);

    final resp = await Supabase.instance.client.from('calendar_dates').insert({
      'user_id': cal.userID,
      'calendar_id': cal.id,
      'date': calendarDateToString(date)
    }).execute();
    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  @override
  Future<void> deleteDate(Calendar cal, DateTime date) async {
    _assignUserId(cal);

    final resp = await Supabase.instance.client
        .from('calendar_dates')
        .delete()
        .eq('calendar_id', cal.id)
        .eq('date', date)
        .execute();
    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  _assignUserId(Calendar cal) {
    cal.userID = Supabase.instance.client.auth.user()?.id;
  }
}
