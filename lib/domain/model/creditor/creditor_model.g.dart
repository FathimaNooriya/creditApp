// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditorModel _$CreditorModelFromJson(Map<String, dynamic> json) =>
    CreditorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: (json['phoneNumber'] as num).toInt(),
      address: json['address'] as String,
      totalOutstandingCredit:
          (json['totalOutstandingCredit'] as num).toDouble(),
    );

Map<String, dynamic> _$CreditorModelToJson(CreditorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'totalOutstandingCredit': instance.totalOutstandingCredit,
    };
