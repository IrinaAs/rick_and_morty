import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse extends Equatable {
  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
  final Info info;
  final List<CharacterResult> results;

  const CharactersResponse({
    @required this.info,
    @required this.results,
  });

  @override
  List<Object> get props => [this.info, this.results];
}
