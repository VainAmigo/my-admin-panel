// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avar_create_claim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvarCreateClaimRequest _$AvarCreateClaimRequestFromJson(
  Map<String, dynamic> json,
) => AvarCreateClaimRequest(
  caseNumber: json['caseNumber'] as String?,
  policyNumber: json['policyNumber'] as String?,
  subjectType: json['subjectType'] as String?,
  identifier: json['identifier'] as String?,
  fullNameOrOrg: json['fullNameOrOrg'] as String?,
  vehicleNumber: json['vehicleNumber'] as String?,
  win: json['win'] as String?,
  govPlate: json['govPlate'] as String?,
  dateOfAccident: json['dateOfAccident'] == null
      ? null
      : DateTime.parse(json['dateOfAccident'] as String),
  dateOfPayout: json['dateOfPayout'] == null
      ? null
      : DateTime.parse(json['dateOfPayout'] as String),
  preliminaryDamage: json['preliminaryDamage'] as num?,
  payoutAmount: json['payoutAmount'] as num?,
  classBefore: json['classBefore'] as num?,
  classAfter: json['classAfter'] as num?,
  kbmAfter: json['kbmAfter'] as num?,
  includedInBM: json['includedInBM'] as bool?,
  comments: json['comments'] as String?,
);

Map<String, dynamic> _$AvarCreateClaimRequestToJson(
  AvarCreateClaimRequest instance,
) => <String, dynamic>{
  'caseNumber': instance.caseNumber,
  'policyNumber': instance.policyNumber,
  'subjectType': instance.subjectType,
  'identifier': instance.identifier,
  'fullNameOrOrg': instance.fullNameOrOrg,
  'vehicleNumber': instance.vehicleNumber,
  'win': instance.win,
  'govPlate': instance.govPlate,
  'dateOfAccident': instance.dateOfAccident?.toIso8601String(),
  'dateOfPayout': instance.dateOfPayout?.toIso8601String(),
  'preliminaryDamage': instance.preliminaryDamage,
  'payoutAmount': instance.payoutAmount,
  'classBefore': instance.classBefore,
  'classAfter': instance.classAfter,
  'kbmAfter': instance.kbmAfter,
  'includedInBM': instance.includedInBM,
  'comments': instance.comments,
};

AvarCreateClaimResponse _$AvarCreateClaimResponseFromJson(
  Map<String, dynamic> json,
) => AvarCreateClaimResponse(status: json['status'] as String);

Map<String, dynamic> _$AvarCreateClaimResponseToJson(
  AvarCreateClaimResponse instance,
) => <String, dynamic>{'status': instance.status};
