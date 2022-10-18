import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

enum TransactionType { payment, credit }

@JsonSerializable(
  fieldRename: FieldRename.snake,
    explicitToJson: true
)
class Transaction {
  final int id;
    final String? name;
    final TransactionType transactionType;
    final double amount;
    final String overview;
    final DateTime transactionTime;
    final bool isPending;
    final String? nameSender;
    final double? cashback;

  Transaction(
      {this.name,
        this.cashback,
        required this.id,
        required this.transactionType,
      required this.amount,
      required this.overview,
      required this.transactionTime,
      required this.isPending,
      this.nameSender,});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

extension TransactionTypeString on TransactionType {
  String fromString() {
    switch (this) {
      case TransactionType.payment:
        return 'payment';
      case TransactionType.credit:
        return 'credit';
    }
  }
}
