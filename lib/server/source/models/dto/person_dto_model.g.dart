// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDtoModel _$PersonDtoModelFromJson(Map<String, dynamic> json) =>
    PersonDtoModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      pin: json['pin'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      familyStatus: json['familyStatus'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      gender: json['gender'] as String?,
      passportSeries: json['passportSeries'] as String?,
      passportNumber: json['passportNumber'] as String?,
      issuedDate: json['issuedDate'] == null
          ? null
          : DateTime.parse(json['issuedDate'] as String),
      passportAuthority: json['passportAuthority'] as String?,
      passportAuthorityCode: json['passportAuthorityCode'] as String?,
      passportAuthorityName: json['passportAuthorityName'] as String?,
      expiredDate: json['expiredDate'] == null
          ? null
          : DateTime.parse(json['expiredDate'] as String),
      voidStatus: json['voidStatus'] as String?,
      message: json['message'] as String?,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$PersonDtoModelToJson(PersonDtoModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'pin': instance.pin,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'familyStatus': instance.familyStatus,
      'maritalStatus': instance.maritalStatus,
      'gender': instance.gender,
      'passportSeries': instance.passportSeries,
      'passportNumber': instance.passportNumber,
      'issuedDate': instance.issuedDate?.toIso8601String(),
      'passportAuthority': instance.passportAuthority,
      'passportAuthorityCode': instance.passportAuthorityCode,
      'passportAuthorityName': instance.passportAuthorityName,
      'expiredDate': instance.expiredDate?.toIso8601String(),
      'voidStatus': instance.voidStatus,
      'message': instance.message,
      'fullName': instance.fullName,
    };
