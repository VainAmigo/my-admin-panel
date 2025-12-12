// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avar_filtered_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvarFilteredSearchRequest _$AvarFilteredSearchRequestFromJson(
  Map<String, dynamic> json,
) => AvarFilteredSearchRequest(
  caseNumber: json['caseNumber'] as String?,
  policyNumber: json['policyNumber'] as String?,
  dateOfAccident: json['dateOfAccident'] == null
      ? null
      : DateTime.parse(json['dateOfAccident'] as String),
  dateOfPayout: json['dateOfPayout'] == null
      ? null
      : DateTime.parse(json['dateOfPayout'] as String),
  status: json['status'] as String?,
  keyword: json['keyword'] as String?,
);

Map<String, dynamic> _$AvarFilteredSearchRequestToJson(
  AvarFilteredSearchRequest instance,
) => <String, dynamic>{
  'caseNumber': instance.caseNumber,
  'policyNumber': instance.policyNumber,
  'dateOfAccident': instance.dateOfAccident?.toIso8601String(),
  'dateOfPayout': instance.dateOfPayout?.toIso8601String(),
  'status': instance.status,
  'keyword': instance.keyword,
};

AvarFilteredSearchResponse _$AvarFilteredSearchResponseFromJson(
  Map<String, dynamic> json,
) => AvarFilteredSearchResponse(
  policies: (json['policies'] as List<dynamic>)
      .map((e) => AvarPolicy.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AvarFilteredSearchResponseToJson(
  AvarFilteredSearchResponse instance,
) => <String, dynamic>{
  'policies': instance.policies,
  'pagination': instance.pagination,
};

AvarPolicy _$AvarPolicyFromJson(Map<String, dynamic> json) => AvarPolicy(
  id: (json['id'] as num).toInt(),
  caseNumber: json['caseNumber'] as String?,
  policyNumber: json['policyNumber'] as String?,
  subjectType: json['subjectType'] as String?,
  identifier: json['identifier'] as String?,
  fullNameOrOrg: json['fullNameOrOrg'] as String?,
  causer: json['causer'] as String?,
  vehicleNumber: json['vehicleNumber'] as String?,
  win: json['win'] as String?,
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
  status: json['status'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AvarPolicyToJson(AvarPolicy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caseNumber': instance.caseNumber,
      'policyNumber': instance.policyNumber,
      'subjectType': instance.subjectType,
      'identifier': instance.identifier,
      'fullNameOrOrg': instance.fullNameOrOrg,
      'causer': instance.causer,
      'vehicleNumber': instance.vehicleNumber,
      'win': instance.win,
      'dateOfAccident': instance.dateOfAccident?.toIso8601String(),
      'dateOfPayout': instance.dateOfPayout?.toIso8601String(),
      'preliminaryDamage': instance.preliminaryDamage,
      'payoutAmount': instance.payoutAmount,
      'classBefore': instance.classBefore,
      'classAfter': instance.classAfter,
      'kbmAfter': instance.kbmAfter,
      'includedInBM': instance.includedInBM,
      'comments': instance.comments,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
    };
