enum TemperateSeasonType { autumn, winter, spring, summer }

class TemperateSeason {
  final int numberOfMonth;
  late final TemperateSeasonType seasonType;
  late final DateTime firstDay;

  TemperateSeason({
    required this.numberOfMonth,
  }) {
    DateTime dateTimeNow = DateTime.now();
    if ((numberOfMonth >= 1 && numberOfMonth <= 2) || numberOfMonth == 12) {
      seasonType = TemperateSeasonType.winter;
      firstDay = DateTime(dateTimeNow.year, DateTime.december, 1);
    } else if (numberOfMonth >= 3 && numberOfMonth <= 5) {
      seasonType = TemperateSeasonType.spring;
      firstDay = DateTime(dateTimeNow.year, DateTime.march, 1);
    } else if (numberOfMonth >= 6 && numberOfMonth <= 8) {
      seasonType = TemperateSeasonType.summer;
      firstDay = DateTime(dateTimeNow.year, DateTime.june, 1);
    } else if (numberOfMonth >= 9 && numberOfMonth <= 11) {
      seasonType = TemperateSeasonType.autumn;
      firstDay = DateTime(dateTimeNow.year, DateTime.september, 1);
    } else {
      throw Exception('This month does not exist.');
    }
  }
}
