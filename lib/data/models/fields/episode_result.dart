import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_result.g.dart';

@JsonSerializable()
class EpisodeResult {
  final int id;
  final String name;
  final String episode;
  // ignore: non_constant_identifier_names
  final String air_date;
  final List<String> characters;
  final String url;
  final String created;

  EpisodeResult(
      {@required this.id,
      @required this.name,
      // ignore: non_constant_identifier_names
      @required this.air_date,
      @required this.characters,
      @required this.episode,
      @required this.url,
      @required this.created});

  factory EpisodeResult.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResultFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeResultToJson(this);
}
