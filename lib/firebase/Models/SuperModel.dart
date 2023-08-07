import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'SuperModel.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@JsonSerializable()
class SuperModel {
  List<Package> data;

  SuperModel({
    required this.data,
  });

  factory SuperModel.fromJson(Map<String, dynamic> map) =>
      _$SuperModelFromJson(map);
  Map<String, dynamic> toJson() => _$SuperModelToJson(this);
  // "color": color,
}

@JsonSerializable()
class Package {
  String packageID;
  String packageName;
  String city;
  String days;
  String price;
  String hotel;
  String cab;
  String guide;

  Package({
    required this.packageID,
    required this.packageName,
    required this.city,
    required this.days,
    required this.price,
    required this.hotel,
    required this.cab,
    required this.guide,
  });

  factory Package.fromJson(Map<String, dynamic> map) => _$PackageFromJson(map);
  Map<String, dynamic> toJson() => _$PackageToJson(this);
}
