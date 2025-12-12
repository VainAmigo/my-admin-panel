// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_licence_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverLicenceDtoModel _$DriverLicenceDtoModelFromJson(
  Map<String, dynamic> json,
) => DriverLicenceDtoModel(
  status: json['status'] as String?,
  pin: json['pin'] as String?,
  birthDate: json['birthDate'] == null
      ? null
      : DateTime.parse(json['birthDate'] as String),
  number: json['number'] as String?,
  dateIssue: json['dateIssue'] == null
      ? null
      : DateTime.parse(json['dateIssue'] as String),
  dateExpiry: json['dateExpiry'] == null
      ? null
      : DateTime.parse(json['dateExpiry'] as String),
  categories: (json['categories'] as List<dynamic>?)
      ?.map(
        (e) => DriverLicenceCategoryItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$DriverLicenceDtoModelToJson(
  DriverLicenceDtoModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'pin': instance.pin,
  'birthDate': instance.birthDate?.toIso8601String(),
  'number': instance.number,
  'dateIssue': instance.dateIssue?.toIso8601String(),
  'dateExpiry': instance.dateExpiry?.toIso8601String(),
  'categories': instance.categories,
};

DriverLicenceCategoryItem _$DriverLicenceCategoryItemFromJson(
  Map<String, dynamic> json,
) => DriverLicenceCategoryItem(
  category: json['category'] as String?,
  dateIssue: json['dateIssue'] == null
      ? null
      : DateTime.parse(json['dateIssue'] as String),
);

Map<String, dynamic> _$DriverLicenceCategoryItemToJson(
  DriverLicenceCategoryItem instance,
) => <String, dynamic>{
  'category': instance.category,
  'dateIssue': instance.dateIssue?.toIso8601String(),
};
