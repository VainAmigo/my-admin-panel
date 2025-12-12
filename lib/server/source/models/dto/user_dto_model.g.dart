// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDtoModel _$UserDtoModelFromJson(Map<String, dynamic> json) => UserDtoModel(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  enabled: json['enabled'] as bool?,
  selfieUrl: json['selfieUrl'] as String?,
  passportFrontUrl: json['passportFrontUrl'] as String?,
  passportBackUrl: json['passportBackUrl'] as String?,
  verificationStatus: $enumDecodeNullable(
    _$VerificationStatusEnumMap,
    json['verificationStatus'],
  ),
  rejectReasonDescription: json['rejectReasonDescription'] as String?,
  pdl: json['pdl'] as bool?,
  beneficiary: json['beneficiary'] as bool?,
);

Map<String, dynamic> _$UserDtoModelToJson(UserDtoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'enabled': instance.enabled,
      'selfieUrl': instance.selfieUrl,
      'passportFrontUrl': instance.passportFrontUrl,
      'passportBackUrl': instance.passportBackUrl,
      'verificationStatus':
          _$VerificationStatusEnumMap[instance.verificationStatus],
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
