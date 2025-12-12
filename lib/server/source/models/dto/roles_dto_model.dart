import 'package:json_annotation/json_annotation.dart';

part 'roles_dto_model.g.dart';

@JsonSerializable()
class RoleDtoModel {
  final int? id;
  final String? code;
  final String? description;
  final bool? active;
  final String? defaultPage;
  final String? selectorId;
  final String? selectorTitle;

  RoleDtoModel({
    this.id,
    this.code,
    this.description,
    this.active,
    this.defaultPage,
    this.selectorId,
    this.selectorTitle,
  });
  factory RoleDtoModel.fromJson(Map<String, dynamic> json) =>
      _$RoleDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleDtoModelToJson(this);
}
