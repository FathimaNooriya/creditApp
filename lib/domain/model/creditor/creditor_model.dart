import 'package:json_annotation/json_annotation.dart';
part 'creditor_model.g.dart';

@JsonSerializable()
class CreditorModel {
  final String id;
  final String name;
  final int phoneNumber;
  final String address;
  final double totalOutstandingCredit;

  CreditorModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.totalOutstandingCredit,
  });
  factory CreditorModel.fromJson(Map<String, dynamic> json) =>
      _$CreditorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditorModelToJson(this);
}
