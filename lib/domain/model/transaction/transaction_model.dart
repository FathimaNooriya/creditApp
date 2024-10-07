import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  final String transactionId;
  final String creditorId;
  final double amount;
  final String type; // Credit or Payment
  final DateTime date;
  final String note;

  TransactionModel({
    required this.transactionId,
    required this.creditorId,
    required this.amount,
    required this.type,
    required this.date,
    required this.note,
  });
  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
