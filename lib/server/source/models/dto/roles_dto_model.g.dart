// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleDtoModel _$RoleDtoModelFromJson(Map<String, dynamic> json) => RoleDtoModel(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  description: json['description'] as String?,
  active: json['active'] as bool?,
  defaultPage: json['defaultPage'] as String?,
  selectorId: json['selectorId'] as String?,
  selectorTitle: json['selectorTitle'] as String?,
);

Map<String, dynamic> _$RoleDtoModelToJson(RoleDtoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'active': instance.active,
      'defaultPage': instance.defaultPage,
      'selectorId': instance.selectorId,
      'selectorTitle': instance.selectorTitle,
    };
