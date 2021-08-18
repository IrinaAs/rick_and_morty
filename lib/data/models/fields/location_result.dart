import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_result.g.dart';

@JsonSerializable()
class LocationResult {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationResult(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.dimension,
      @required this.residents,
      @required this.url,
      @required this.created});

  factory LocationResult.fromJson(Map<String, dynamic> json) =>
      _$LocationResultFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResultToJson(this);
}
