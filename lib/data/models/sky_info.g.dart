// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sky_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkyInfoModelImpl _$$SkyInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$SkyInfoModelImpl(
      isSky: json['is_sky'] as bool,
      averageConf: (json['average_conf'] as num).toInt(),
    );

Map<String, dynamic> _$$SkyInfoModelImplToJson(_$SkyInfoModelImpl instance) =>
    <String, dynamic>{
      'is_sky': instance.isSky,
      'average_conf': instance.averageConf,
    };
