// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsResponse _$LocationsResponseFromJson(Map<String, dynamic> json) {
  return LocationsResponse(
    info: json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : LocationResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LocationsResponseToJson(LocationsResponse instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
