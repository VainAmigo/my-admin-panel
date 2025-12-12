// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserDataModel _$LoginUserDataModelFromJson(Map<String, dynamic> json) =>
    LoginUserDataModel(
      id: json['id'] as num,
      phoneNumber: json['phoneNumber'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$LoginUserDataModelToJson(LoginUserDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
    };
