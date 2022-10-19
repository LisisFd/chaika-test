import 'package:chaika_test/domain/entity/temperate%20_season.dart';
import 'package:chaika_test/domain/extentions/date_time_extention.dart';

class PointsService {
  PointsService._();

  static String calculatePoints() {
    DateTime dateTimeNow = DateTime.now();
    TemperateSeason season = TemperateSeason(numberOfMonth: dateTimeNow.month);
    int differenceDays = dateTimeNow.daysBetween(season.firstDay);

    final double points = _considerPoints(differenceDays);
    final String totalPoint = '${(points / 1000.0).round()}K';
    return totalPoint;
  }

  static double _considerPoints(int days) {
    double prePrevious = 0;
    double previous = 0;
    for (int i = 0; i < days; i++) {
      if (i == 0) {
        prePrevious = 2;
      } else if (i == 1) {
        previous = 3;
      } else {
        final result = prePrevious + previous * 0.6;

        prePrevious = previous;
        previous = result;
      }
    }
    return previous;
  }
}
