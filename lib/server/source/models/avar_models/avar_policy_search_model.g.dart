// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avar_policy_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvarPolicySearchResponse _$AvarPolicySearchResponseFromJson(
  Map<String, dynamic> json,
) => AvarPolicySearchResponse(
  policyNumber: json['policyNumber'] as String,
  validFrom: DateTime.parse(json['validFrom'] as String),
  validTo: DateTime.parse(json['validTo'] as String),
  carPolicyPeriod: json['carPolicyPeriod'] as num,
  amount: (json['amount'] as num).toDouble(),
  status: $enumDecode(_$PolicyStatusEnumMap, json['status']),
  allowedDrivers: json['allowedDrivers'] as String,
  personFullName: json['personFullName'] as String,
  personPhone: json['personPhone'] as String,
  personIin: json['personIin'] as String,
  vehicleNumber: json['vehicleNumber'] as String,
  vin: json['vin'] as String,
  brand: json['brand'] as String,
  model: json['model'] as String,
  year: json['year'] as num,
  drivers: (json['drivers'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AvarPolicySearchResponseToJson(
  AvarPolicySearchResponse instance,
) => <String, dynamic>{
  'policyNumber': instance.policyNumber,
  'validFrom': instance.validFrom.toIso8601String(),
  'validTo': instance.validTo.toIso8601String(),
  'carPolicyPeriod': instance.carPolicyPeriod,
  'amount': instance.amount,
  'status': _$PolicyStatusEnumMap[instance.status]!,
  'allowedDrivers': instance.allowedDrivers,
  'personFullName': instance.personFullName,
  'personPhone': instance.personPhone,
  'personIin': instance.personIin,
  'vehicleNumber': instance.vehicleNumber,
  'vin': instance.vin,
  'brand': instance.brand,
  'model': instance.model,
  'year': instance.year,
  'drivers': instance.drivers,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$PolicyStatusEnumMap = {
  PolicyStatus.active: 'ACTIVE',
  PolicyStatus.unPaid: 'UNPAID',
  PolicyStatus.expired: 'EXPIRED',
};
