// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoMatchModelImpl _$$PhotoMatchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotoMatchModelImpl(
      id: json['id'] as String,
      userPhotoId: json['user_photo_id'] as String,
      matchedPhotoId: json['matched_photo_id'] as String,
      matchedAt: DateTime.parse(json['matched_at'] as String),
    );

Map<String, dynamic> _$$PhotoMatchModelImplToJson(
        _$PhotoMatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_photo_id': instance.userPhotoId,
      'matched_photo_id': instance.matchedPhotoId,
      'matched_at': instance.matchedAt.toIso8601String(),
    };
