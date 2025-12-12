import 'package:admin_panel/server/server.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_search_model.g.dart';

@JsonSerializable()
class UsersSearchRequest {
  final int? userId;
  final String? username;
  final VerificationStatus? verificationStatus;
  final String? role;
  final String? keyword;

  UsersSearchRequest({
    this.userId,
    this.username,
    this.verificationStatus,
    this.role,
    this.keyword,
  });

  factory UsersSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$UsersSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UsersSearchRequestToJson(this);
}

@JsonSerializable()
class UsersSearchResponse {
  final List<UsersItem> data;
  final Pagination pagination;

  UsersSearchResponse({required this.data, required this.pagination});

  factory UsersSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersSearchResponseToJson(this);
}

@JsonSerializable()
class UsersItem {
  UserDtoModel? userDto;
  List<RoleDtoModel>? roles;
  PersonDtoModel? personDto;
  DriverLicenceDtoModel? driverLicence;
  List<CarDtoModel>? carDtos;

  UsersItem({
    required this.userDto,
    required this.roles,
    required this.personDto,
    required this.driverLicence,
    required this.carDtos,
  });

  factory UsersItem.fromJson(Map<String, dynamic> json) =>
      _$UsersItemFromJson(json);

  Map<String, dynamic> toJson() => _$UsersItemToJson(this);
}
