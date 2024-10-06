import 'package:json_annotation/json_annotation.dart';

part 'creditor_entity.g.dart';

@JsonSerializable()
class CreditorEntity {
  final String? id;
  final String? name;
  final int? phoneNumber;
  final String? address;
  final double? totalOutstandingCredit;

  CreditorEntity({
    this.id,
    this.name,
    this.phoneNumber,
    this.address,
    this.totalOutstandingCredit,
  });
  factory CreditorEntity.fromJson(Map<String, dynamic> json) =>
      _$CreditorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreditorEntityToJson(this);
}
