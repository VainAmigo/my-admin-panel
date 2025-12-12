// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDtoModel _$CarDtoModelFromJson(Map<String, dynamic> json) => CarDtoModel(
  vin: json['vin'] as String?,
  mark: json['mark'] as String?,
  model: json['model'] as String?,
  year: (json['year'] as num?)?.toInt(),
  carType: json['carType'] as String?,
  carCategory: json['carCategory'] as String?,
  govPlate: json['govPlate'] as String?,
  brand: json['brand'] as String?,
  engineVolume: (json['engineVolume'] as num?)?.toInt(),
  motorType: json['motorType'] as String?,
  specialNotes: json['specialNotes'] as String?,
  tintingWindow: json['tintingWindow'] as String?,
  paidVersion: json['paidVersion'] as bool?,
  vid: json['vid'] as String?,
  color: json['color'] as String?,
  chassisNo: json['chassisNo'] as String?,
  bodyType: json['bodyType'] as String?,
  steering: json['steering'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
  maxLoad: (json['maxLoad'] as num?)?.toInt(),
  docSeries: json['docSeries'] as String?,
  docNumber: json['docNumber'] as String?,
  passengerCapacity: (json['passengerCapacity'] as num?)?.toInt(),
  carStatus: json['carStatus'] as String?,
);

Map<String, dynamic> _$CarDtoModelToJson(CarDtoModel instance) =>
    <String, dynamic>{
      'vin': instance.vin,
      'mark': instance.mark,
      'model': instance.model,
      'year': instance.year,
      'carType': instance.carType,
      'carCategory': instance.carCategory,
      'govPlate': instance.govPlate,
      'brand': instance.brand,
      'engineVolume': instance.engineVolume,
      'motorType': instance.motorType,
      'specialNotes': instance.specialNotes,
      'tintingWindow': instance.tintingWindow,
      'paidVersion': instance.paidVersion,
      'vid': instance.vid,
      'color': instance.color,
      'chassisNo': instance.chassisNo,
      'bodyType': instance.bodyType,
      'steering': instance.steering,
      'weight': instance.weight,
      'maxLoad': instance.maxLoad,
      'docSeries': instance.docSeries,
      'docNumber': instance.docNumber,
      'passengerCapacity': instance.passengerCapacity,
      'carStatus': instance.carStatus,
    };
