import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:rick_and_morty_app/data/models/fields/location_result.dart';

part 'locations_response.g.dart';

@JsonSerializable()
class LocationsResponse extends Equatable {
  factory LocationsResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsResponseToJson(this);
  final Info info;
  final List<LocationResult> results;

  const LocationsResponse({
    @required this.info,
    @required this.results,
  });

  @override
  List<Object> get props => [this.info, this.results];
}
