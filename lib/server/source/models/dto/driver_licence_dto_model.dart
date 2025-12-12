import 'package:json_annotation/json_annotation.dart';

part 'driver_licence_dto_model.g.dart';

@JsonSerializable()
class DriverLicenceDtoModel {
  final String? status;
  final String? pin;
  final DateTime? birthDate;
  final String? number;
  final DateTime? dateIssue;
  final DateTime? dateExpiry;
  final List<DriverLicenceCategoryItem>? categories;

  DriverLicenceDtoModel({
    this.status,
    this.pin,
    this.birthDate,
    this.number,
    this.dateIssue,
    this.dateExpiry,
    this.categories,
  });

  factory DriverLicenceDtoModel.fromJson(Map<String, dynamic> json) =>
      _$DriverLicenceDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverLicenceDtoModelToJson(this);
}

@JsonSerializable()
class DriverLicenceCategoryItem {
  final String? category;
  final DateTime? dateIssue;

  DriverLicenceCategoryItem({required this.category, required this.dateIssue});

  factory DriverLicenceCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$DriverLicenceCategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$DriverLicenceCategoryItemToJson(this);
}
