import 'package:intl/intl.dart';

extension ConvertDateTime on DateTime {
  String parseToString() {
    final int timeDifference = daysBetween(null);
    if (timeDifference <= 1 && timeDifference >= -1) {
      switch (timeDifference) {
        case -1:
          return 'Yesterday';
        case 0:
          return 'Today';
        case 1:
          return 'Tomorrow';
      }
    } else if (timeDifference >= -6 && _isDayInWeek(this)) {
      return DateFormat('EEEE').format(this);
    }
    return DateFormat("d/M/yy").format(this);
  }

  int daysBetween(DateTime? from) {
    if (from == null) {
      from = DateTime.now();
    } else {
      from = DateTime(from.year, from.month, from.day);
    }
    final to = DateTime(year, month, day);
    return (to.difference(from).inHours / 24).round();
  }

  bool _isDayInWeek(DateTime dateTime) {
    if (DateTime.now().weekday - dateTime.weekday > 0) {
      return true;
    }
    return false;
  }
}
