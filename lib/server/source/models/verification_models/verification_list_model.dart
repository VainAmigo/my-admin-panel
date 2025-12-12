import 'package:admin_panel/server/server.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_list_model.g.dart';

@JsonSerializable()
class VerificationListRequest {
  final int? userId;
  final String? username;
  final VerificationStatus? verificationStatus;
  final String? role;
  final String? keyword;

  VerificationListRequest({
    this.userId,
    this.username,
    this.verificationStatus,
    this.role,
    this.keyword,
  });

  factory VerificationListRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationListRequestToJson(this);
}

@JsonSerializable()
class VerificationListResponse {
  final List<VerificationItem> data;
  final Pagination pagination;

  VerificationListResponse({required this.data, required this.pagination});

  factory VerificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationListResponseToJson(this);
}

@JsonSerializable()
class VerificationItem {
  UserDtoModel? userDto;
  List<RoleDtoModel>? roles;
  PersonDtoModel? personDto;
  DriverLicenceDtoModel? driverLicence;
  List<CarDtoModel>? carDtos;

  VerificationItem({
    this.userDto,
    this.roles,
    this.personDto,
    this.driverLicence,
    this.carDtos,
  });

  factory VerificationItem.fromJson(Map<String, dynamic> json) =>
      _$VerificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationItemToJson(this);
}
