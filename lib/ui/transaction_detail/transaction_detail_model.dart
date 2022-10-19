import 'package:chaika_test/domain/entity/transaction.dart';
import 'package:chaika_test/domain/service/Account_Service.dart';
import 'package:intl/intl.dart';

class TransactionDetailViewModel {
  final double _amount;
  final String name;
  final DateTime _transactionTime;
  final TransactionType _transactionType;
  final String status;
  final String overview;

  String get amount {
    if (_transactionType == TransactionType.payment) {
      return '+\$${_amount.toStringAsFixed(2)}';
    }
    return '\$${_amount.toStringAsFixed(2)}';
  }

  String get transactionTime {
    return DateFormat("d/M/yy H:m:s").format(_transactionTime);
  }

  factory TransactionDetailViewModel.fromTransaction(Transaction transaction) {
    return TransactionDetailViewModel(
      overview: transaction.overview,
      amount: transaction.amount,
      name: transaction.name ?? transaction.transactionType.fromString(),
      transactionType: transaction.transactionType,
      transactionTime: transaction.transactionTime,
      status: transaction.isPending ? 'Pending' : 'Approved',
    );
  }

  const TransactionDetailViewModel({
    required this.status,
    required this.overview,
    required double amount,
    required this.name,
    required DateTime transactionTime,
    required TransactionType transactionType,
  })  : _amount = amount,
        _transactionTime = transactionTime,
        _transactionType = transactionType;
}

class TransactionDetailModel {
  final int transactionId;
  final AccountService _accountService = AccountService();
  late final TransactionDetailViewModel transactionDetailViewModel;

  TransactionDetailModel({
    required this.transactionId,
  }) {
    _accountService.loadInfo();
    final transactions = _accountService.accountInfo.transactions;
    transactionDetailViewModel = TransactionDetailViewModel.fromTransaction(
        transactions.firstWhere((element) => element.id == transactionId));
  }
}
