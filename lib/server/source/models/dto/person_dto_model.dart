import 'package:json_annotation/json_annotation.dart';

part 'person_dto_model.g.dart';

@JsonSerializable()
class PersonDtoModel {
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? pin;
  final DateTime? dateOfBirth;
  final String? familyStatus;
  final String? maritalStatus;
  final String? gender;
  final String? passportSeries;
  final String? passportNumber;
  final DateTime? issuedDate;
  final String? passportAuthority;
  final String? passportAuthorityCode;
  final String? passportAuthorityName;
  final DateTime? expiredDate;
  final String? voidStatus;
  final String? message;
  final String? fullName;

  PersonDtoModel({
    this.firstName,
    this.lastName,
    this.middleName,
    this.pin,
    this.dateOfBirth,
    this.familyStatus,
    this.maritalStatus,
    this.gender,
    this.passportSeries,
    this.passportNumber,
    this.issuedDate,
    this.passportAuthority,
    this.passportAuthorityCode,
    this.passportAuthorityName,
    this.expiredDate,
    this.voidStatus,
    this.message,
    this.fullName,
  });
  factory PersonDtoModel.fromJson(Map<String, dynamic> json) => _$PersonDtoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PersonDtoModelToJson(this);
}