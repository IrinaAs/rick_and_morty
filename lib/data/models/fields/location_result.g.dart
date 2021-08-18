// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResult _$LocationResultFromJson(Map<String, dynamic> json) {
  return LocationResult(
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
    dimension: json['dimension'] as String,
    residents: (json['residents'] as List)?.map((e) => e as String)?.toList(),
    url: json['url'] as String,
    created: json['created'] as String,
  );
}

Map<String, dynamic> _$LocationResultToJson(LocationResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'dimension': instance.dimension,
      'residents': instance.residents,
      'url': instance.url,
      'created': instance.created,
    };
