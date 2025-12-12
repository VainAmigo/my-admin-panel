import 'package:admin_panel/server/server.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_set_verification_status_model.g.dart';

@JsonSerializable()
class VerificationSetVerificationStatusBody{
  const VerificationSetVerificationStatusBody({
    required this.status,
    required this.rejectReasonDescription,
  });

  final String status;
  final String rejectReasonDescription;

  factory VerificationSetVerificationStatusBody.fromJson(Map<String, dynamic> json) => _$VerificationSetVerificationStatusBodyFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationSetVerificationStatusBodyToJson(this);
}

@JsonSerializable()
class VerificationSetVerificationStatusResponse {
  const VerificationSetVerificationStatusResponse({
    required this.id,
    required this.username,
    required this.enabled,
    required this.selfieUrl,
    required this.passportFrontUrl,
    required this.passportBackUrl,
    required this.verificationStatus,
    required this.rejectReasonDescription,
    required this.pdl,
    required this.beneficiary,
  });

  final int id;
  final String username;
  final bool enabled;
  final String selfieUrl;
  final String passportFrontUrl;
  final String passportBackUrl;
  final VerificationStatus verificationStatus;
  final String rejectReasonDescription;
  final bool pdl;
  final bool beneficiary;

  factory VerificationSetVerificationStatusResponse.fromJson(Map<String, dynamic> json) => _$VerificationSetVerificationStatusResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationSetVerificationStatusResponseToJson(this);
}