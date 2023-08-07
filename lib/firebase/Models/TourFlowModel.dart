import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@JsonSerializable()
class TourSuperModel {
  List<Flows> tourdata;

  TourSuperModel({
    required this.tourdata,
  });

  factory TourSuperModel.fromJson(Map<String, dynamic> map) =>
      _$TourSuperModelFromJson(map);
  Map<String, dynamic> toJson() => _$TourSuperModelToJson(this);
  // "color": color,
}

_$TourSuperModelFromJson(Map<String, dynamic> json) => TourSuperModel(
      tourdata: (json['tourflow'] as List<dynamic>)
          .map((e) => Flows.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TourSuperModelToJson(TourSuperModel instance) =>
    <String, dynamic>{
      'tourflow': instance.tourdata,
    };

@JsonSerializable()
class Flows {
  String dayname;
  String desc;
  String start;
  String end;

  Flows({
    required this.dayname,
    required this.desc,
    required this.start,
    required this.end,
  });

  factory Flows.fromJson(Map<String, dynamic> map) => _$TourFlowFromJson(map);
  Map<String, dynamic> toJson() => _$TourFlowToJson(this);
}

Flows _$TourFlowFromJson(Map<String, dynamic> json) => Flows(
      dayname: json['dayname'] as String,
      desc: json['desc'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$TourFlowToJson(Flows instance) => <String, dynamic>{
      'dayname': instance.dayname,
      'desc': instance.desc,
      'start': instance.start,
      'end': instance.end,
    };
