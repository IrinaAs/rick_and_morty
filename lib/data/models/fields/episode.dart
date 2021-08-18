import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'episode.g.dart';

@JsonSerializable()
class Episode {
  final String url;

  Episode({@required this.url});

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
