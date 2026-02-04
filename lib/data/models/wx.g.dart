// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WxModelImpl _$$WxModelImplFromJson(Map<String, dynamic> json) =>
    _$WxModelImpl(
      requestId: json['requestId'] as String,
      wxdata: (json['wxdata'] as List<dynamic>)
          .map((e) => Wxdata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WxModelImplToJson(_$WxModelImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'wxdata': instance.wxdata,
    };

_$WxdataImpl _$$WxdataImplFromJson(Map<String, dynamic> json) => _$WxdataImpl(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      srf: (json['srf'] as List<dynamic>)
          .map((e) => Srf.fromJson(e as Map<String, dynamic>))
          .toList(),
      mrf: (json['mrf'] as List<dynamic>)
          .map((e) => Mrf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WxdataImplToJson(_$WxdataImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'srf': instance.srf,
      'mrf': instance.mrf,
    };

_$SrfImpl _$$SrfImplFromJson(Map<String, dynamic> json) => _$SrfImpl(
      date: json['date'] as String,
      wx: (json['wx'] as num).toInt(),
      temp: (json['temp'] as num).toInt(),
      prec: (json['prec'] as num).toInt(),
      arpress: (json['arpress'] as num).toInt(),
      wndspd: (json['wndspd'] as num).toInt(),
      wnddir: (json['wnddir'] as num).toInt(),
      rhum: (json['rhum'] as num).toInt(),
    );

Map<String, dynamic> _$$SrfImplToJson(_$SrfImpl instance) => <String, dynamic>{
      'date': instance.date,
      'wx': instance.wx,
      'temp': instance.temp,
      'prec': instance.prec,
      'arpress': instance.arpress,
      'wndspd': instance.wndspd,
      'wnddir': instance.wnddir,
      'rhum': instance.rhum,
    };

_$MrfImpl _$$MrfImplFromJson(Map<String, dynamic> json) => _$MrfImpl(
      date: json['date'] as String,
      wx: (json['wx'] as num).toInt(),
      maxtemp: (json['maxtemp'] as num).toInt(),
      mintemp: (json['mintemp'] as num).toInt(),
      pop: (json['pop'] as num).toInt(),
    );

Map<String, dynamic> _$$MrfImplToJson(_$MrfImpl instance) => <String, dynamic>{
      'date': instance.date,
      'wx': instance.wx,
      'maxtemp': instance.maxtemp,
      'mintemp': instance.mintemp,
      'pop': instance.pop,
    };
