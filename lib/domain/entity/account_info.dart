import 'package:chaika_test/domain/entity/transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_info.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake,)
class AccountInfo {
  final int balance;
  final List<Transaction> transactions;
  final DateTime registrationDate;

  AccountInfo(
      {required this.balance,
      required this.transactions,
      required this.registrationDate});
  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);
}


