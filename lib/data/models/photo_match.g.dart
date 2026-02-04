// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoMatchModelImpl _$$PhotoMatchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotoMatchModelImpl(
      id: json['id'] as String,
      userPhotoId: json['userPhotoId'] as String,
      matchedPhotoId: json['matchedPhotoId'] as String,
      matchedAt: DateTime.parse(json['matched_at'] as String),
    );

Map<String, dynamic> _$$PhotoMatchModelImplToJson(
        _$PhotoMatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userPhotoId': instance.userPhotoId,
      'matchedPhotoId': instance.matchedPhotoId,
      'matched_at': instance.matchedAt.toIso8601String(),
    };
