// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersSearchRequest _$UsersSearchRequestFromJson(Map<String, dynamic> json) =>
    UsersSearchRequest(
      userId: (json['userId'] as num?)?.toInt(),
      username: json['username'] as String?,
      verificationStatus: $enumDecodeNullable(
        _$VerificationStatusEnumMap,
        json['verificationStatus'],
      ),
      role: json['role'] as String?,
      keyword: json['keyword'] as String?,
    );

Map<String, dynamic> _$UsersSearchRequestToJson(UsersSearchRequest instance) =>
    <String, dynamic>{
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

UsersSearchResponse _$UsersSearchResponseFromJson(Map<String, dynamic> json) =>
    UsersSearchResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => UsersItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: Pagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UsersSearchResponseToJson(
  UsersSearchResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};

UsersItem _$UsersItemFromJson(Map<String, dynamic> json) => UsersItem(
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

Map<String, dynamic> _$UsersItemToJson(UsersItem instance) => <String, dynamic>{
  'userDto': instance.userDto,
  'roles': instance.roles,
  'personDto': instance.personDto,
  'driverLicence': instance.driverLicence,
  'carDtos': instance.carDtos,
};
