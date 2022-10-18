// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      name: json['name'] as String?,
      cashback: (json['cashback'] as num?)?.toDouble(),
      id: json['id'] as int,
      transactionType:
          $enumDecode(_$TransactionTypeEnumMap, json['transaction_type']),
      amount: (json['amount'] as num).toDouble(),
      overview: json['overview'] as String,
      transactionTime: DateTime.parse(json['transaction_time'] as String),
      isPending: json['is_pending'] as bool,
      nameSender: json['name_sender'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'transaction_type': _$TransactionTypeEnumMap[instance.transactionType]!,
      'amount': instance.amount,
      'overview': instance.overview,
      'transaction_time': instance.transactionTime.toIso8601String(),
      'is_pending': instance.isPending,
      'name_sender': instance.nameSender,
      'cashback': instance.cashback,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.payment: 'payment',
  TransactionType.credit: 'credit',
};
