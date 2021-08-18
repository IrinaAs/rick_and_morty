// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeResult _$EpisodeResultFromJson(Map<String, dynamic> json) {
  return EpisodeResult(
    id: json['id'] as int,
    name: json['name'] as String,
    air_date: json['air_date'] as String,
    characters: (json['characters'] as List)?.map((e) => e as String)?.toList(),
    episode: json['episode'] as String,
    url: json['url'] as String,
    created: json['created'] as String,
  );
}

Map<String, dynamic> _$EpisodeResultToJson(EpisodeResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'episode': instance.episode,
      'air_date': instance.air_date,
      'characters': instance.characters,
      'url': instance.url,
      'created': instance.created,
    };
