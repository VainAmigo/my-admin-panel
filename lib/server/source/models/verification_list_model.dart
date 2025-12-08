import 'package:admin_panel/server/server.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_list_model.g.dart';

@JsonSerializable()
class VarificationListResponse {
  final List<VerificationItem> verificationsList;
  final Pagination pagination;

  VarificationListResponse({
    required this.verificationsList,
    required this.pagination,
  });

  factory VarificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$VarificationListResponseFromJson(json);
}

@JsonSerializable()
class VerificationItem {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String status;
  final String selfLink;
  final String passportFrontLink;
  final String passportBackLink;


  VerificationItem({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.selfLink,
    required this.passportFrontLink,
    required this.passportBackLink,
  });

  factory VerificationItem.fromJson(Map<String, dynamic> json) =>
      _$VerificationItemFromJson(json);
}