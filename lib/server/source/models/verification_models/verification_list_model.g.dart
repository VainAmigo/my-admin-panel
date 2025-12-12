// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationListRequest _$VerificationListRequestFromJson(
  Map<String, dynamic> json,
) => VerificationListRequest(
  userId: (json['userId'] as num?)?.toInt(),
  username: json['username'] as String?,
  verificationStatus: $enumDecodeNullable(
    _$VerificationStatusEnumMap,
    json['verificationStatus'],
  ),
  role: json['role'] as String?,
  keyword: json['keyword'] as String?,
);

Map<String, dynamic> _$VerificationListRequestToJson(
  VerificationListRequest instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'username': instance.username,
  'verificationStatus':
      _$VerificationStatusEnumMap[instance.verificationStatus],
  'role': instance.role,
  'keyword': instance.keyword,
};

const _$VerificationStatusEnumMap = {
  VerificationStatus.verified: 'VERIFIED',
  VerificationStatus.pending: 'PENDING',
  VerificationStatus.notVerified: 'NOT_VERIFIED',
  VerificationStatus.rejected: 'REJECTED',
};

VerificationListResponse _$VerificationListResponseFromJson(
  Map<String, dynamic> json,
) => VerificationListResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => VerificationItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerificationListResponseToJson(
  VerificationListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};

VerificationItem _$VerificationItemFromJson(Map<String, dynamic> json) =>
    VerificationItem(
      userDto: json['userDto'] == null
          ? null
          : UserDtoModel.fromJson(json['userDto'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleDtoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      personDto: json['personDto'] == null
          ? null
          : PersonDtoModel.fromJson(json['personDto'] as Map<String, dynamic>),
      driverLicence: json['driverLicence'] == null
          ? null
          : DriverLicenceDtoModel.fromJson(
              json['driverLicence'] as Map<String, dynamic>,
            ),
      carDtos: (json['carDtos'] as List<dynamic>?)
          ?.map((e) => CarDtoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VerificationItemToJson(VerificationItem instance) =>
    <String, dynamic>{
      'userDto': instance.userDto,
      'roles': instance.roles,
      'personDto': instance.personDto,
      'driverLicence': instance.driverLicence,
      'carDtos': instance.carDtos,
    };
