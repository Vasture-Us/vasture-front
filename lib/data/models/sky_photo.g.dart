// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sky_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkyPhotoModelImpl _$$SkyPhotoModelImplFromJson(Map<String, dynamic> json) =>
    _$SkyPhotoModelImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      weatherId: json['weather_id'] as String?,
      imageUrl: json['image_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$SkyPhotoModelImplToJson(_$SkyPhotoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'weather_id': instance.weatherId,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
    };
