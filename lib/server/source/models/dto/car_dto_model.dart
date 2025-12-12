import 'package:json_annotation/json_annotation.dart';

part 'car_dto_model.g.dart';

@JsonSerializable()
class CarDtoModel {
  final String? vin;
  final String? mark;
  final String? model;
  final int? year;
  final String? carType;
  final String? carCategory;
  final String? govPlate;
  final String? brand;
  final int? engineVolume;
  final String? motorType;
  final String? specialNotes;
  final String? tintingWindow;
  final bool? paidVersion;
  final String? vid;
  final String? color;
  final String? chassisNo;
  final String? bodyType;
  final String? steering;
  final int? weight;
  final int? maxLoad;
  final String? docSeries;
  final String? docNumber;
  final int? passengerCapacity;
  final String? carStatus;

  CarDtoModel({
    this.vin,
    this.mark,
    this.model,
    this.year,
    this.carType,
    this.carCategory,
    this.govPlate,
    this.brand,
    this.engineVolume,
    this.motorType,
    this.specialNotes,
    this.tintingWindow,
    this.paidVersion,
    this.vid,
    this.color,
    this.chassisNo,
    this.bodyType,
    this.steering,
    this.weight,
    this.maxLoad,
    this.docSeries,
    this.docNumber,
    this.passengerCapacity,
    this.carStatus,
  });
  factory CarDtoModel.fromJson(Map<String, dynamic> json) =>
      _$CarDtoModelFromJson(json);
  Map<String, dynamic> toJson() => _$CarDtoModelToJson(this);
}
