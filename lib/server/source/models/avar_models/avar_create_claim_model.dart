import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avar_create_claim_model.g.dart';

@JsonSerializable()
class AvarCreateClaimRequest {
  final String? caseNumber;
  final String? policyNumber;
  final String? subjectType;
  final String? identifier;
  final String? fullNameOrOrg;
  final String? vehicleNumber;
  final String? win;
  final String? govPlate;
  final DateTime? dateOfAccident;
  final DateTime? dateOfPayout;
  final num? preliminaryDamage;
  final num? payoutAmount;
  final num? classBefore;
  final num? classAfter;
  final num? kbmAfter;
  final bool? includedInBM;
  final String? comments;

  AvarCreateClaimRequest({
    this.caseNumber,
    this.policyNumber,
    this.subjectType,
    this.identifier,
    this.fullNameOrOrg,
    this.vehicleNumber,
    this.win,
    this.govPlate,
    this.dateOfAccident,
    this.dateOfPayout,
    this.preliminaryDamage,
    this.payoutAmount,
    this.classBefore,
    this.classAfter,
    this.kbmAfter,
    this.includedInBM,
    this.comments,
  });

  factory AvarCreateClaimRequest.fromJson(Map<String, dynamic> json) => _$AvarCreateClaimRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AvarCreateClaimRequestToJson(this);
}

@immutable
@JsonSerializable()
class AvarCreateClaimResponse {
  final String status;

  const AvarCreateClaimResponse({
    required this.status,
  });

  factory AvarCreateClaimResponse.fromJson(Map<String, dynamic> json) => _$AvarCreateClaimResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvarCreateClaimResponseToJson(this);
}