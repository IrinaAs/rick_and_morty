import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/data/models/fields/location.dart';
import 'origin.dart';

part 'character_result.g.dart';

@JsonSerializable()
class CharacterResult {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  CharacterResult(
      {@required this.id,
      @required this.name,
      @required this.status,
      @required this.species,
      @required this.type,
      @required this.gender,
      @required this.origin,
      @required this.location,
      @required this.image,
      @required this.episode,
      @required this.url,
      @required this.created});

  factory CharacterResult.fromJson(Map<String, dynamic> json) =>
      _$CharacterResultFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResultToJson(this);
}
