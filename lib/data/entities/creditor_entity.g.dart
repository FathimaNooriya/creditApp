// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditorEntity _$CreditorEntityFromJson(Map<String, dynamic> json) =>
    CreditorEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phoneNumber: (json['phoneNumber'] as num?)?.toInt(),
      address: json['address'] as String?,
      totalOutstandingCredit:
          (json['totalOutstandingCredit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreditorEntityToJson(CreditorEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'totalOutstandingCredit': instance.totalOutstandingCredit,
    };
