import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';

part 'episodes_response.g.dart';

@JsonSerializable()
class EpisodesResponse extends Equatable {
  factory EpisodesResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesResponseToJson(this);
  final Info info;
  final List<EpisodeResult> results;

  const EpisodesResponse({
    @required this.info,
    @required this.results,
  });

  @override
  List<Object> get props => [this.info, this.results];
}
