// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      transactionId: json['transactionId'] as String,
      creditorId: json['creditorId'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'creditorId': instance.creditorId,
      'amount': instance.amount,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
    };
