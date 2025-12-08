// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VarificationListResponse _$VarificationListResponseFromJson(
  Map<String, dynamic> json,
) => VarificationListResponse(
  verificationsList: (json['verificationsList'] as List<dynamic>)
      .map((e) => VerificationItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VarificationListResponseToJson(
  VarificationListResponse instance,
) => <String, dynamic>{
  'verificationsList': instance.verificationsList,
  'pagination': instance.pagination,
};

VerificationItem _$VerificationItemFromJson(Map<String, dynamic> json) =>
    VerificationItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      status: json['status'] as String,
      selfLink: json['selfLink'] as String,
      passportFrontLink: json['passportFrontLink'] as String,
      passportBackLink: json['passportBackLink'] as String,
    );

Map<String, dynamic> _$VerificationItemToJson(VerificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'status': instance.status,
      'selfLink': instance.selfLink,
      'passportFrontLink': instance.passportFrontLink,
      'passportBackLink': instance.passportBackLink,
    };
