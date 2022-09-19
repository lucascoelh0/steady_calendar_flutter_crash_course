import 'package:intl/intl.dart';
import 'dart:collection';

typedef CalendarDate = DateTime;

typedef CalendarDates = HashMap<int, CalendarDate>;

const String calendarDateFormat = 'yyyy-MM-dd';

String calendarDateToString(CalendarDate value) =>
    DateFormat(calendarDateFormat).format(value);

CalendarDate stringToCalendarDate(String value) =>
    DateTime.parse("$value 00:00:00Z");
