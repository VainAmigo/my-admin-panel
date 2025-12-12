import 'package:json_annotation/json_annotation.dart';

part 'avar_filtered_search_model.g.dart';

@JsonSerializable()
class AvarFilteredSearchRequest {
  final String? caseNumber;
  final String? policyNumber;
  final DateTime? dateOfAccident;
  final DateTime? dateOfPayout;
  final String? status;
  final String? keyword;

  AvarFilteredSearchRequest({
    this.caseNumber,
    this.policyNumber,
    this.dateOfAccident,
    this.dateOfPayout,
    this.status,
    this.keyword,
  });

  Map<String, dynamic> toJson() => _$AvarFilteredSearchRequestToJson(this);

  factory AvarFilteredSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$AvarFilteredSearchRequestFromJson(json);
}

@JsonSerializable()
class AvarFilteredSearchResponse {
  final List<AvarPolicy> policies;
  final Pagination pagination;

  AvarFilteredSearchResponse({
    required this.policies,
    required this.pagination,
  });

  factory AvarFilteredSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$AvarFilteredSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvarFilteredSearchResponseToJson(this);
}

@JsonSerializable()
class AvarPolicy {
  final int id;
  final String? caseNumber;
  final String? policyNumber;
  final String? subjectType;
  final String? identifier;
  final String? fullNameOrOrg;
  final String? causer;
  final String? vehicleNumber;
  final String? win;
  final DateTime? dateOfAccident;
  final DateTime? dateOfPayout;
  final num? preliminaryDamage;
  final num? payoutAmount;
  final num? classBefore;
  final num? classAfter;
  final num? kbmAfter;
  final bool? includedInBM;
  final String? comments;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AvarPolicy({
    required this.id,
    this.caseNumber,
    this.policyNumber,
    this.subjectType,
    this.identifier,
    this.fullNameOrOrg,
    this.causer,
    this.vehicleNumber,
    this.win,
    this.dateOfAccident,
    this.dateOfPayout,
    this.preliminaryDamage,
    this.payoutAmount,
    this.classBefore,
    this.classAfter,
    this.kbmAfter,
    this.includedInBM,
    this.comments,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AvarPolicy.fromJson(Map<String, dynamic> json) =>
      _$AvarPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$AvarPolicyToJson(this);
}

@JsonSerializable()
class Pagination {
  final int total;
  final int limit;
  final int page;
  final int pages;

  Pagination({
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
