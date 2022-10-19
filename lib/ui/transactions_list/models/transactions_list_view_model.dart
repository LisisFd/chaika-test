part of 'transactions_list_model.dart';

class TransactionsListViewModel {
  final double _cardBalance;
  late final String dailyPoints;
  final List<TransactionRowModel> transactions;

  String get cardBalance => "\$${_cardBalance.toStringAsFixed(2)}";

  String get available {
    final balance = (1500 - _cardBalance).toStringAsFixed(2);
    final result = '\$$balance Available';
    return result;
  }

  String calculatePoints() {
    DateTime dateTimeNow = DateTime.now();
    TemperateSeason season = TemperateSeason(numberOfMonth: dateTimeNow.month);
    int differenceDays;
    switch (season.seasonType) {
      case TemperateSeasonType.autumn:
        differenceDays = DateTime(dateTimeNow.year, DateTime.september, 1)
            .difference(dateTimeNow)
            .inDays;
        break;
      case TemperateSeasonType.winter:
        differenceDays = DateTime(dateTimeNow.year, DateTime.december, 1)
            .difference(dateTimeNow)
            .inDays;
        break;
      case TemperateSeasonType.spring:
        differenceDays = DateTime(dateTimeNow.year, DateTime.march, 1)
            .difference(dateTimeNow)
            .inDays;
        break;
      case TemperateSeasonType.summer:
        differenceDays = DateTime(dateTimeNow.year, DateTime.june, 1)
            .difference(dateTimeNow)
            .inDays;
        break;
    }
    final double points = considerPoints(differenceDays);
    final String totalPoint = '${(points / 1000.0).round()}K';
    return totalPoint;
  }

  double considerPoints(int days) {
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

  TransactionsListViewModel({
    required this.transactions,
    required double cardBalance,
  }) : _cardBalance = cardBalance {
    dailyPoints = calculatePoints();
  }

  factory TransactionsListViewModel.fromAccountInfo(AccountInfo accountInfo) {
    return TransactionsListViewModel(
      transactions: accountInfo.transactions
          .map(
              (transaction) => TransactionRowModel.fromTransaction(transaction))
          .toList(),
      cardBalance: accountInfo.balance,
    );
  }
}
