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

  TransactionsListViewModel({
    required this.transactions,
    required double cardBalance,
  }) : _cardBalance = cardBalance {
    dailyPoints = PointsService.calculatePoints();
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
