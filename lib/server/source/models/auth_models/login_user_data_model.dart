import 'package:json_annotation/json_annotation.dart';

part 'login_user_data_model.g.dart';

@JsonSerializable()
class LoginUserDataModel {
  final num id;
  final String phoneNumber;
  final String fullName;

  LoginUserDataModel({
    required this.id,
    required this.phoneNumber,
    required this.fullName,
  });

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserDataModelToJson(this);
}
