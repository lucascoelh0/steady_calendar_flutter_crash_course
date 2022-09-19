import 'package:json_annotation/json_annotation.dart';
import 'calendar_date.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => calendarDateToString(object);
}
