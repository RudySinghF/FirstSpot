// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SuperModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperModel _$SuperModelFromJson(Map<String, dynamic> json) => SuperModel(
      data: (json['package'] as List<dynamic>)
          .map((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuperModelToJson(SuperModel instance) =>
    <String, dynamic>{
      'package': instance.data,
    };

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
      packageID: json['packageID'] as String,
      packageName: json['packageName'] as String,
      city: json['city'] as String,
      days: json['days'] as String,
      price: json['price'] as String,
      hotel: json['hotel'] as String,
      cab: json['cab'] as String,
      guide: json['guide'] as String,
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'packageID': instance.packageID,
      'packageName': instance.packageName,
      'city': instance.city,
      'days': instance.days,
      'price': instance.price,
      'hotel': instance.hotel,
      'cab': instance.cab,
      'guide': instance.guide,
    };
