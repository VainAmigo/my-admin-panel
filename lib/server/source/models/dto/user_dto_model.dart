import 'package:json_annotation/json_annotation.dart';

part 'user_dto_model.g.dart';

@JsonSerializable()
class UserDtoModel {
  final int? id;
  final String? username;
  final bool? enabled;
  final String? selfieUrl;
  final String? passportFrontUrl;
  final String? passportBackUrl;
  final VerificationStatus? verificationStatus;
  final String? rejectReasonDescription;
  final bool? pdl;
  final bool? beneficiary;

  UserDtoModel({
    this.id,
    this.username,
    this.enabled,
    this.selfieUrl,
    this.passportFrontUrl,
    this.passportBackUrl,
    this.verificationStatus,
    this.rejectReasonDescription,
    this.pdl,
    this.beneficiary,
  });

  factory UserDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UserDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoModelToJson(this);
}

@JsonEnum()
enum VerificationStatus {
  @JsonValue('VERIFIED')
  verified,
  @JsonValue('PENDING')
  pending,
  @JsonValue('NOT_VERIFIED')
  notVerified,
  @JsonValue('REJECTED')
  rejected,
}