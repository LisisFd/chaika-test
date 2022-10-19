part of 'transactions_list_model.dart';

class TransactionRowModel {
  final int id;
  final String name;
  final TransactionType _transactionType;
  final String _overview;
  final String? nameSender;
  final double _amount;
  final double? _cashBack;
  final DateTime _transactionTime;
  final bool _isPending;

  String get amount {
    String amount;
    switch (_transactionType) {
      case TransactionType.credit:
        amount = '\$${_amount.toStringAsFixed(2)}';
        return amount;
      case TransactionType.payment:
        amount = '+\$${_amount.toStringAsFixed(2)}';
        return amount;
    }
  }

  String get overview {
    if (_isPending) {
      return "Pending — $_overview";
    }
    return _overview;
  }

  String? get cashBack {
    if (_cashBack == null) return null;
    String cashBack = '${(_cashBack! * 100).toInt()}%';
    return cashBack;
  }

  String get timeTransaction {
    String startResult = nameSender != null ? "$nameSender — " : "";
    final int timeDifference = _calculateDifference(_transactionTime);
    if (timeDifference <= 1 && timeDifference >= -1) {
      switch (timeDifference) {
        case -1:
          return '${startResult}Yesterday';
        case 0:
          return '${startResult}Today';
        case 1:
          return '${startResult}Tomorrow';
      }
    } else if (timeDifference >= -6 && _isDayInWeek(_transactionTime)) {
      return '$startResult${DateFormat('EEEE').format(_transactionTime)}';
    }
    return '$startResult${DateFormat("d/M/yy").format(_transactionTime)}';
  }

  bool _isDayInWeek(DateTime dateTime) {
    if (DateTime.now().weekday - dateTime.weekday > 0) {
      return true;
    }
    return false;
  }

  int _calculateDifference(DateTime date) {
    return date.difference(DateTime.now()).inDays;
  }

  factory TransactionRowModel.fromTransaction(Transaction transaction) {
    return TransactionRowModel(
        id: transaction.id,
        transactionType: transaction.transactionType,
        transactionTime: transaction.transactionTime,
        isPending: transaction.isPending,
        name: transaction.name ??
            transaction.transactionType.fromString().capitalize(),
        overview: transaction.overview,
        amount: transaction.amount,
        nameSender: transaction.nameSender,
        cashBack: transaction.cashback);
  }

  TransactionRowModel({
    required this.id,
    required this.name,
    required this.nameSender,
    required amount,
    required cashBack,
    required TransactionType transactionType,
    required String overview,
    required DateTime transactionTime,
    required bool isPending,
  })  : _transactionType = transactionType,
        _overview = overview,
        _amount = amount,
        _cashBack = cashBack,
        _transactionTime = transactionTime,
        _isPending = isPending;
}
