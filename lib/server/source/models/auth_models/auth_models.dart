import 'package:admin_panel/server/source/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@JsonSerializable()
class AuthResponse {
  final List<String> accessiblePages;
  final List<String> roles;
  final String token;
  final LoginUserDataModel user;

  AuthResponse({
    required this.accessiblePages,
    required this.roles,
    required this.token,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
