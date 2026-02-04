import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'wx.freezed.dart';
part 'wx.g.dart';

@freezed
abstract class WxModel with _$WxModel {
  const factory WxModel({
    required String requestId,
    required List<Wxdata> wxdata,
  }) = _WxModel;
  factory WxModel.fromJson(Map<String, Object?> json) =>
      _$WxModelFromJson(json);
}

@freezed
abstract class Wxdata with _$Wxdata {
  const factory Wxdata({
    required double lat,
    required double lon,
    required List<Srf> srf,
    required List<Mrf> mrf,
  }) = _Wxdata;

  factory Wxdata.fromJson(Map<String, Object?> json) => _$WxdataFromJson(json);
}

@freezed
abstract class Srf with _$Srf {
  const factory Srf({
    required String date,
    required int wx,
    required int temp,
    required int prec,
    required int arpress,
    required int wndspd,
    required int wnddir,
    required int rhum,
    // required int feelidx,
    // required int feeltmp,
  }) = _Srf;

  factory Srf.fromJson(Map<String, Object?> json) => _$SrfFromJson(json);
}

@freezed
abstract class Mrf with _$Mrf {
  const factory Mrf({
    required String date,
    required int wx,
    required int maxtemp,
    required int mintemp,
    required int pop,
  }) = _Mrf;

  factory Mrf.fromJson(Map<String, Object?> json) => _$MrfFromJson(json);
}
