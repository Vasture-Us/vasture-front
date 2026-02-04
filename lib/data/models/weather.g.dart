// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      id: json['id'] as String,
      condition: json['condition'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      location: json['location'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'condition': instance.condition,
      'temperature': instance.temperature,
      'location': instance.location,
      'created_at': instance.createdAt.toIso8601String(),
    };
