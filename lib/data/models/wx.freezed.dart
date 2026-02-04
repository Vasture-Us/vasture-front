// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wx.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WxModel _$WxModelFromJson(Map<String, dynamic> json) {
  return _WxModel.fromJson(json);
}

/// @nodoc
mixin _$WxModel {
  String get requestId => throw _privateConstructorUsedError;
  List<Wxdata> get wxdata => throw _privateConstructorUsedError;

  /// Serializes this WxModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WxModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WxModelCopyWith<WxModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WxModelCopyWith<$Res> {
  factory $WxModelCopyWith(WxModel value, $Res Function(WxModel) then) =
      _$WxModelCopyWithImpl<$Res, WxModel>;
  @useResult
  $Res call({String requestId, List<Wxdata> wxdata});
}

/// @nodoc
class _$WxModelCopyWithImpl<$Res, $Val extends WxModel>
    implements $WxModelCopyWith<$Res> {
  _$WxModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WxModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? wxdata = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      wxdata: null == wxdata
          ? _value.wxdata
          : wxdata // ignore: cast_nullable_to_non_nullable
              as List<Wxdata>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WxModelImplCopyWith<$Res> implements $WxModelCopyWith<$Res> {
  factory _$$WxModelImplCopyWith(
          _$WxModelImpl value, $Res Function(_$WxModelImpl) then) =
      __$$WxModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId, List<Wxdata> wxdata});
}

/// @nodoc
class __$$WxModelImplCopyWithImpl<$Res>
    extends _$WxModelCopyWithImpl<$Res, _$WxModelImpl>
    implements _$$WxModelImplCopyWith<$Res> {
  __$$WxModelImplCopyWithImpl(
      _$WxModelImpl _value, $Res Function(_$WxModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WxModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? wxdata = null,
  }) {
    return _then(_$WxModelImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      wxdata: null == wxdata
          ? _value._wxdata
          : wxdata // ignore: cast_nullable_to_non_nullable
              as List<Wxdata>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WxModelImpl with DiagnosticableTreeMixin implements _WxModel {
  const _$WxModelImpl(
      {required this.requestId, required final List<Wxdata> wxdata})
      : _wxdata = wxdata;

  factory _$WxModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WxModelImplFromJson(json);

  @override
  final String requestId;
  final List<Wxdata> _wxdata;
  @override
  List<Wxdata> get wxdata {
    if (_wxdata is EqualUnmodifiableListView) return _wxdata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wxdata);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WxModel(requestId: $requestId, wxdata: $wxdata)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WxModel'))
      ..add(DiagnosticsProperty('requestId', requestId))
      ..add(DiagnosticsProperty('wxdata', wxdata));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WxModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            const DeepCollectionEquality().equals(other._wxdata, _wxdata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, requestId, const DeepCollectionEquality().hash(_wxdata));

  /// Create a copy of WxModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WxModelImplCopyWith<_$WxModelImpl> get copyWith =>
      __$$WxModelImplCopyWithImpl<_$WxModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WxModelImplToJson(
      this,
    );
  }
}

abstract class _WxModel implements WxModel {
  const factory _WxModel(
      {required final String requestId,
      required final List<Wxdata> wxdata}) = _$WxModelImpl;

  factory _WxModel.fromJson(Map<String, dynamic> json) = _$WxModelImpl.fromJson;

  @override
  String get requestId;
  @override
  List<Wxdata> get wxdata;

  /// Create a copy of WxModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WxModelImplCopyWith<_$WxModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Wxdata _$WxdataFromJson(Map<String, dynamic> json) {
  return _Wxdata.fromJson(json);
}

/// @nodoc
mixin _$Wxdata {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  List<Srf> get srf => throw _privateConstructorUsedError;
  List<Mrf> get mrf => throw _privateConstructorUsedError;

  /// Serializes this Wxdata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Wxdata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WxdataCopyWith<Wxdata> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WxdataCopyWith<$Res> {
  factory $WxdataCopyWith(Wxdata value, $Res Function(Wxdata) then) =
      _$WxdataCopyWithImpl<$Res, Wxdata>;
  @useResult
  $Res call({double lat, double lon, List<Srf> srf, List<Mrf> mrf});
}

/// @nodoc
class _$WxdataCopyWithImpl<$Res, $Val extends Wxdata>
    implements $WxdataCopyWith<$Res> {
  _$WxdataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Wxdata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? srf = null,
    Object? mrf = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      srf: null == srf
          ? _value.srf
          : srf // ignore: cast_nullable_to_non_nullable
              as List<Srf>,
      mrf: null == mrf
          ? _value.mrf
          : mrf // ignore: cast_nullable_to_non_nullable
              as List<Mrf>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WxdataImplCopyWith<$Res> implements $WxdataCopyWith<$Res> {
  factory _$$WxdataImplCopyWith(
          _$WxdataImpl value, $Res Function(_$WxdataImpl) then) =
      __$$WxdataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon, List<Srf> srf, List<Mrf> mrf});
}

/// @nodoc
class __$$WxdataImplCopyWithImpl<$Res>
    extends _$WxdataCopyWithImpl<$Res, _$WxdataImpl>
    implements _$$WxdataImplCopyWith<$Res> {
  __$$WxdataImplCopyWithImpl(
      _$WxdataImpl _value, $Res Function(_$WxdataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Wxdata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? srf = null,
    Object? mrf = null,
  }) {
    return _then(_$WxdataImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      srf: null == srf
          ? _value._srf
          : srf // ignore: cast_nullable_to_non_nullable
              as List<Srf>,
      mrf: null == mrf
          ? _value._mrf
          : mrf // ignore: cast_nullable_to_non_nullable
              as List<Mrf>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WxdataImpl with DiagnosticableTreeMixin implements _Wxdata {
  const _$WxdataImpl(
      {required this.lat,
      required this.lon,
      required final List<Srf> srf,
      required final List<Mrf> mrf})
      : _srf = srf,
        _mrf = mrf;

  factory _$WxdataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WxdataImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;
  final List<Srf> _srf;
  @override
  List<Srf> get srf {
    if (_srf is EqualUnmodifiableListView) return _srf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_srf);
  }

  final List<Mrf> _mrf;
  @override
  List<Mrf> get mrf {
    if (_mrf is EqualUnmodifiableListView) return _mrf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mrf);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Wxdata(lat: $lat, lon: $lon, srf: $srf, mrf: $mrf)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Wxdata'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lon', lon))
      ..add(DiagnosticsProperty('srf', srf))
      ..add(DiagnosticsProperty('mrf', mrf));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WxdataImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            const DeepCollectionEquality().equals(other._srf, _srf) &&
            const DeepCollectionEquality().equals(other._mrf, _mrf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lat,
      lon,
      const DeepCollectionEquality().hash(_srf),
      const DeepCollectionEquality().hash(_mrf));

  /// Create a copy of Wxdata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WxdataImplCopyWith<_$WxdataImpl> get copyWith =>
      __$$WxdataImplCopyWithImpl<_$WxdataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WxdataImplToJson(
      this,
    );
  }
}

abstract class _Wxdata implements Wxdata {
  const factory _Wxdata(
      {required final double lat,
      required final double lon,
      required final List<Srf> srf,
      required final List<Mrf> mrf}) = _$WxdataImpl;

  factory _Wxdata.fromJson(Map<String, dynamic> json) = _$WxdataImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  List<Srf> get srf;
  @override
  List<Mrf> get mrf;

  /// Create a copy of Wxdata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WxdataImplCopyWith<_$WxdataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Srf _$SrfFromJson(Map<String, dynamic> json) {
  return _Srf.fromJson(json);
}

/// @nodoc
mixin _$Srf {
  String get date => throw _privateConstructorUsedError;
  int get wx => throw _privateConstructorUsedError;
  int get temp => throw _privateConstructorUsedError;
  int get prec => throw _privateConstructorUsedError;
  int get arpress => throw _privateConstructorUsedError;
  int get wndspd => throw _privateConstructorUsedError;
  int get wnddir => throw _privateConstructorUsedError;
  int get rhum => throw _privateConstructorUsedError;

  /// Serializes this Srf to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Srf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SrfCopyWith<Srf> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrfCopyWith<$Res> {
  factory $SrfCopyWith(Srf value, $Res Function(Srf) then) =
      _$SrfCopyWithImpl<$Res, Srf>;
  @useResult
  $Res call(
      {String date,
      int wx,
      int temp,
      int prec,
      int arpress,
      int wndspd,
      int wnddir,
      int rhum});
}

/// @nodoc
class _$SrfCopyWithImpl<$Res, $Val extends Srf> implements $SrfCopyWith<$Res> {
  _$SrfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Srf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? wx = null,
    Object? temp = null,
    Object? prec = null,
    Object? arpress = null,
    Object? wndspd = null,
    Object? wnddir = null,
    Object? rhum = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      wx: null == wx
          ? _value.wx
          : wx // ignore: cast_nullable_to_non_nullable
              as int,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as int,
      prec: null == prec
          ? _value.prec
          : prec // ignore: cast_nullable_to_non_nullable
              as int,
      arpress: null == arpress
          ? _value.arpress
          : arpress // ignore: cast_nullable_to_non_nullable
              as int,
      wndspd: null == wndspd
          ? _value.wndspd
          : wndspd // ignore: cast_nullable_to_non_nullable
              as int,
      wnddir: null == wnddir
          ? _value.wnddir
          : wnddir // ignore: cast_nullable_to_non_nullable
              as int,
      rhum: null == rhum
          ? _value.rhum
          : rhum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SrfImplCopyWith<$Res> implements $SrfCopyWith<$Res> {
  factory _$$SrfImplCopyWith(_$SrfImpl value, $Res Function(_$SrfImpl) then) =
      __$$SrfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int wx,
      int temp,
      int prec,
      int arpress,
      int wndspd,
      int wnddir,
      int rhum});
}

/// @nodoc
class __$$SrfImplCopyWithImpl<$Res> extends _$SrfCopyWithImpl<$Res, _$SrfImpl>
    implements _$$SrfImplCopyWith<$Res> {
  __$$SrfImplCopyWithImpl(_$SrfImpl _value, $Res Function(_$SrfImpl) _then)
      : super(_value, _then);

  /// Create a copy of Srf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? wx = null,
    Object? temp = null,
    Object? prec = null,
    Object? arpress = null,
    Object? wndspd = null,
    Object? wnddir = null,
    Object? rhum = null,
  }) {
    return _then(_$SrfImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      wx: null == wx
          ? _value.wx
          : wx // ignore: cast_nullable_to_non_nullable
              as int,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as int,
      prec: null == prec
          ? _value.prec
          : prec // ignore: cast_nullable_to_non_nullable
              as int,
      arpress: null == arpress
          ? _value.arpress
          : arpress // ignore: cast_nullable_to_non_nullable
              as int,
      wndspd: null == wndspd
          ? _value.wndspd
          : wndspd // ignore: cast_nullable_to_non_nullable
              as int,
      wnddir: null == wnddir
          ? _value.wnddir
          : wnddir // ignore: cast_nullable_to_non_nullable
              as int,
      rhum: null == rhum
          ? _value.rhum
          : rhum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SrfImpl with DiagnosticableTreeMixin implements _Srf {
  const _$SrfImpl(
      {required this.date,
      required this.wx,
      required this.temp,
      required this.prec,
      required this.arpress,
      required this.wndspd,
      required this.wnddir,
      required this.rhum});

  factory _$SrfImpl.fromJson(Map<String, dynamic> json) =>
      _$$SrfImplFromJson(json);

  @override
  final String date;
  @override
  final int wx;
  @override
  final int temp;
  @override
  final int prec;
  @override
  final int arpress;
  @override
  final int wndspd;
  @override
  final int wnddir;
  @override
  final int rhum;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Srf(date: $date, wx: $wx, temp: $temp, prec: $prec, arpress: $arpress, wndspd: $wndspd, wnddir: $wnddir, rhum: $rhum)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Srf'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('wx', wx))
      ..add(DiagnosticsProperty('temp', temp))
      ..add(DiagnosticsProperty('prec', prec))
      ..add(DiagnosticsProperty('arpress', arpress))
      ..add(DiagnosticsProperty('wndspd', wndspd))
      ..add(DiagnosticsProperty('wnddir', wnddir))
      ..add(DiagnosticsProperty('rhum', rhum));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SrfImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.wx, wx) || other.wx == wx) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.prec, prec) || other.prec == prec) &&
            (identical(other.arpress, arpress) || other.arpress == arpress) &&
            (identical(other.wndspd, wndspd) || other.wndspd == wndspd) &&
            (identical(other.wnddir, wnddir) || other.wnddir == wnddir) &&
            (identical(other.rhum, rhum) || other.rhum == rhum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, wx, temp, prec, arpress, wndspd, wnddir, rhum);

  /// Create a copy of Srf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SrfImplCopyWith<_$SrfImpl> get copyWith =>
      __$$SrfImplCopyWithImpl<_$SrfImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SrfImplToJson(
      this,
    );
  }
}

abstract class _Srf implements Srf {
  const factory _Srf(
      {required final String date,
      required final int wx,
      required final int temp,
      required final int prec,
      required final int arpress,
      required final int wndspd,
      required final int wnddir,
      required final int rhum}) = _$SrfImpl;

  factory _Srf.fromJson(Map<String, dynamic> json) = _$SrfImpl.fromJson;

  @override
  String get date;
  @override
  int get wx;
  @override
  int get temp;
  @override
  int get prec;
  @override
  int get arpress;
  @override
  int get wndspd;
  @override
  int get wnddir;
  @override
  int get rhum;

  /// Create a copy of Srf
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SrfImplCopyWith<_$SrfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Mrf _$MrfFromJson(Map<String, dynamic> json) {
  return _Mrf.fromJson(json);
}

/// @nodoc
mixin _$Mrf {
  String get date => throw _privateConstructorUsedError;
  int get wx => throw _privateConstructorUsedError;
  int get maxtemp => throw _privateConstructorUsedError;
  int get mintemp => throw _privateConstructorUsedError;
  int get pop => throw _privateConstructorUsedError;

  /// Serializes this Mrf to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mrf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MrfCopyWith<Mrf> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MrfCopyWith<$Res> {
  factory $MrfCopyWith(Mrf value, $Res Function(Mrf) then) =
      _$MrfCopyWithImpl<$Res, Mrf>;
  @useResult
  $Res call({String date, int wx, int maxtemp, int mintemp, int pop});
}

/// @nodoc
class _$MrfCopyWithImpl<$Res, $Val extends Mrf> implements $MrfCopyWith<$Res> {
  _$MrfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mrf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? wx = null,
    Object? maxtemp = null,
    Object? mintemp = null,
    Object? pop = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      wx: null == wx
          ? _value.wx
          : wx // ignore: cast_nullable_to_non_nullable
              as int,
      maxtemp: null == maxtemp
          ? _value.maxtemp
          : maxtemp // ignore: cast_nullable_to_non_nullable
              as int,
      mintemp: null == mintemp
          ? _value.mintemp
          : mintemp // ignore: cast_nullable_to_non_nullable
              as int,
      pop: null == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MrfImplCopyWith<$Res> implements $MrfCopyWith<$Res> {
  factory _$$MrfImplCopyWith(_$MrfImpl value, $Res Function(_$MrfImpl) then) =
      __$$MrfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int wx, int maxtemp, int mintemp, int pop});
}

/// @nodoc
class __$$MrfImplCopyWithImpl<$Res> extends _$MrfCopyWithImpl<$Res, _$MrfImpl>
    implements _$$MrfImplCopyWith<$Res> {
  __$$MrfImplCopyWithImpl(_$MrfImpl _value, $Res Function(_$MrfImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mrf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? wx = null,
    Object? maxtemp = null,
    Object? mintemp = null,
    Object? pop = null,
  }) {
    return _then(_$MrfImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      wx: null == wx
          ? _value.wx
          : wx // ignore: cast_nullable_to_non_nullable
              as int,
      maxtemp: null == maxtemp
          ? _value.maxtemp
          : maxtemp // ignore: cast_nullable_to_non_nullable
              as int,
      mintemp: null == mintemp
          ? _value.mintemp
          : mintemp // ignore: cast_nullable_to_non_nullable
              as int,
      pop: null == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MrfImpl with DiagnosticableTreeMixin implements _Mrf {
  const _$MrfImpl(
      {required this.date,
      required this.wx,
      required this.maxtemp,
      required this.mintemp,
      required this.pop});

  factory _$MrfImpl.fromJson(Map<String, dynamic> json) =>
      _$$MrfImplFromJson(json);

  @override
  final String date;
  @override
  final int wx;
  @override
  final int maxtemp;
  @override
  final int mintemp;
  @override
  final int pop;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Mrf(date: $date, wx: $wx, maxtemp: $maxtemp, mintemp: $mintemp, pop: $pop)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Mrf'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('wx', wx))
      ..add(DiagnosticsProperty('maxtemp', maxtemp))
      ..add(DiagnosticsProperty('mintemp', mintemp))
      ..add(DiagnosticsProperty('pop', pop));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MrfImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.wx, wx) || other.wx == wx) &&
            (identical(other.maxtemp, maxtemp) || other.maxtemp == maxtemp) &&
            (identical(other.mintemp, mintemp) || other.mintemp == mintemp) &&
            (identical(other.pop, pop) || other.pop == pop));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, wx, maxtemp, mintemp, pop);

  /// Create a copy of Mrf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MrfImplCopyWith<_$MrfImpl> get copyWith =>
      __$$MrfImplCopyWithImpl<_$MrfImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MrfImplToJson(
      this,
    );
  }
}

abstract class _Mrf implements Mrf {
  const factory _Mrf(
      {required final String date,
      required final int wx,
      required final int maxtemp,
      required final int mintemp,
      required final int pop}) = _$MrfImpl;

  factory _Mrf.fromJson(Map<String, dynamic> json) = _$MrfImpl.fromJson;

  @override
  String get date;
  @override
  int get wx;
  @override
  int get maxtemp;
  @override
  int get mintemp;
  @override
  int get pop;

  /// Create a copy of Mrf
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MrfImplCopyWith<_$MrfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
