import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avar_policy_search_model.g.dart';

@immutable
@JsonSerializable()
class AvarPolicySearchResponse {
  final String policyNumber;
  final DateTime validFrom;
  final DateTime validTo;
  final num carPolicyPeriod;
  final double amount;
  final PolicyStatus status;
  final String allowedDrivers;
  final String personFullName;
  final String personPhone;
  final String personIin;
  final String vehicleNumber;
  final String vin;
  final String brand;
  final String model;
  final num year;
  final List<String> drivers;
  final DateTime createdAt;

  bool get isActive => status == PolicyStatus.active;

  AvarPolicySearchResponse({
    required this.policyNumber,
    required this.validFrom,
    required this.validTo,
    required this.carPolicyPeriod,
    required this.amount,
    required this.status,
    required this.allowedDrivers,
    required this.personFullName,
    required this.personPhone,
    required this.personIin,
    required this.vehicleNumber,
    required this.vin,
    required this.brand,
    required this.model,
    required this.year,
    required this.drivers,
    required this.createdAt,
  });

  factory AvarPolicySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$AvarPolicySearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvarPolicySearchResponseToJson(this);
}

@JsonEnum()
enum PolicyStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('UNPAID')
  unPaid,
  @JsonValue('EXPIRED')
  expired,
}
