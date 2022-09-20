import 'package:crash_couse_advanced/util/alert.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:crash_couse_advanced/models/calendar.dart';
import '/util/colors.dart';
import 'package:crash_couse_advanced/config/styles.dart';
import 'package:intl/intl.dart';

import '../../../models/calendar.dart';

final now = DateTime.now();
final firstDay = DateTime(now.year, now.month - 3, now.day);
final lastDay = DateTime(now.year, now.month, now.day);

class MonthGrid extends StatefulWidget {
  final Calendar cal;
  final Function(BuildContext, Calendar, DateTime) dateSelected;
  final Function(BuildContext, Calendar, DateTime) dateDeselected;

  const MonthGrid(
    this.cal,
    this.dateSelected,
    this.dateDeselected, {
    Key? key,
  }) : super(key: key);

  @override
  State<MonthGrid> createState() => _MonthGridState();
}

class _MonthGridState extends State<MonthGrid> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      calendarStyle: CalendarStyle(
        todayTextStyle: _defaultTextStyle(
          color: hexToColor(widget.cal.colorHex),
        ),
        todayDecoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: hexToColor(widget.cal.colorHex),
          shape: BoxShape.circle,
        ),
        selectedTextStyle: _defaultTextStyle(
          color: Colors.white,
        ),
        weekendTextStyle: _defaultTextStyle(),
        defaultTextStyle: _defaultTextStyle(
          color: Styles.primaryTextColor,
        ),
        outsideTextStyle: _defaultTextStyle(
          color: Styles.tertiaryTextColor,
        ),
        disabledTextStyle: _defaultTextStyle(
          color: Styles.tertiaryTextColor,
        ),
      ),
      focusedDay: DateTime.now(),
      startingDayOfWeek: StartingDayOfWeek.sunday,
      headerStyle: HeaderStyle(
        leftChevronVisible: false,
        rightChevronVisible: false,
        headerPadding: const EdgeInsets.fromLTRB(3.0, 20.0, 0.0, 20.0),
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMMM(locale).format(date).toUpperCase(),
        titleTextStyle: _defaultTextStyle(color: Styles.tertiaryTextColor),
        formatButtonVisible: false,
        titleCentered: false,
      ),
      daysOfWeekHeight: 40.0,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: _defaultTextStyle(color: Styles.primaryTextColor),
        weekendStyle: _defaultTextStyle(color: Styles.primaryTextColor),
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date)[0],
      ),
      selectedDayPredicate: (day) => (widget.cal.dates != null &&
          widget.cal.dates!.containsKey(day.hashCode)),
      onDaySelected: (selectedDay, focusedDay) =>
          _onDaySelected(selectedDay, focusedDay),
    );
  }

  _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (selectedDay.isAfter(DateTime.now().toUtc())) {
      showAlert(context, '', 'Cannot select dates in the future.');
      return;
    }

    // either remove or add date
    setState(() {
      if (widget.cal.dates!.containsKey(selectedDay.hashCode)) {
        widget.cal.dates!.remove(selectedDay.hashCode);
        widget.dateDeselected(context, widget.cal, selectedDay);
      } else {
        widget.cal.dates![selectedDay.hashCode] = selectedDay;
        widget.dateSelected(context, widget.cal, selectedDay);
      }
    });
  }

  TextStyle _defaultTextStyle({Color? color}) {
    return TextStyle(
      fontFamily: Styles.secondaryFontRegular,
      fontSize: Styles.smallTextFontSize,
      color: color,
    );
  }
}
