enum TemperateSeasonType { autumn, winter, spring, summer }

class TemperateSeason {
  final int numberOfMonth;
  late final TemperateSeasonType seasonType;

  TemperateSeason({
    required this.numberOfMonth,
  }) {
    if ((numberOfMonth >= 1 && numberOfMonth <= 2) || numberOfMonth == 12) {
      seasonType = TemperateSeasonType.winter;
    } else if (numberOfMonth >= 3 && numberOfMonth <= 5) {
      seasonType = TemperateSeasonType.spring;
    } else if (numberOfMonth >= 6 && numberOfMonth <= 8) {
      seasonType = TemperateSeasonType.summer;
    } else if (numberOfMonth >= 9 && numberOfMonth <= 11) {
      seasonType = TemperateSeasonType.autumn;
    } else {
      throw Exception('This month does not exist.');
    }
  }
}
