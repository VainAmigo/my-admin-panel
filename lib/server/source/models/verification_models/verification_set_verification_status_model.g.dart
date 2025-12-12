// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_set_verification_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationSetVerificationStatusBody
_$VerificationSetVerificationStatusBodyFromJson(Map<String, dynamic> json) =>
    VerificationSetVerificationStatusBody(
      status: json['status'] as String,
      rejectReasonDescription: json['rejectReasonDescription'] as String,
    );

Map<String, dynamic> _$VerificationSetVerificationStatusBodyToJson(
  VerificationSetVerificationStatusBody instance,
) => <String, dynamic>{
  'status': instance.status,
  'rejectReasonDescription': instance.rejectReasonDescription,
};

VerificationSetVerificationStatusResponse
_$VerificationSetVerificationStatusResponseFromJson(
  Map<String, dynamic> json,
) => VerificationSetVerificationStatusResponse(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  enabled: json['enabled'] as bool,
  selfieUrl: json['selfieUrl'] as String,
  passportFrontUrl: json['passportFrontUrl'] as String,
  passportBackUrl: json['passportBackUrl'] as String,
  verificationStatus: $enumDecode(
    _$VerificationStatusEnumMap,
    json['verificationStatus'],
  ),
  rejectReasonDescription: json['rejectReasonDescription'] as String,
  pdl: json['pdl'] as bool,
  beneficiary: json['beneficiary'] as bool,
);

Map<String, dynamic> _$VerificationSetVerificationStatusResponseToJson(
  VerificationSetVerificationStatusResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'enabled': instance.enabled,
  'selfieUrl': instance.selfieUrl,
  'passportFrontUrl': instance.passportFrontUrl,
  'passportBackUrl': instance.passportBackUrl,
  'verificationStatus':
      _$VerificationStatusEnumMap[instance.verificationStatus]!,
  'rejectReasonDescription': instance.rejectReasonDescription,
  'pdl': instance.pdl,
  'beneficiary': instance.beneficiary,
};

const _$VerificationStatusEnumMap = {
  VerificationStatus.verified: 'VERIFIED',
  VerificationStatus.pending: 'PENDING',
  VerificationStatus.notVerified: 'NOT_VERIFIED',
  VerificationStatus.rejected: 'REJECTED',
};
