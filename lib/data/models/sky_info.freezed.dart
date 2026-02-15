// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sky_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkyInfoModel _$SkyInfoModelFromJson(Map<String, dynamic> json) {
  return _SkyInfoModel.fromJson(json);
}

/// @nodoc
mixin _$SkyInfoModel {
  bool get isSky => throw _privateConstructorUsedError;
  int get averageConf => throw _privateConstructorUsedError;

  /// Serializes this SkyInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkyInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkyInfoModelCopyWith<SkyInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkyInfoModelCopyWith<$Res> {
  factory $SkyInfoModelCopyWith(
          SkyInfoModel value, $Res Function(SkyInfoModel) then) =
      _$SkyInfoModelCopyWithImpl<$Res, SkyInfoModel>;
  @useResult
  $Res call({bool isSky, int averageConf});
}

/// @nodoc
class _$SkyInfoModelCopyWithImpl<$Res, $Val extends SkyInfoModel>
    implements $SkyInfoModelCopyWith<$Res> {
  _$SkyInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkyInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSky = null,
    Object? averageConf = null,
  }) {
    return _then(_value.copyWith(
      isSky: null == isSky
          ? _value.isSky
          : isSky // ignore: cast_nullable_to_non_nullable
              as bool,
      averageConf: null == averageConf
          ? _value.averageConf
          : averageConf // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkyInfoModelImplCopyWith<$Res>
    implements $SkyInfoModelCopyWith<$Res> {
  factory _$$SkyInfoModelImplCopyWith(
          _$SkyInfoModelImpl value, $Res Function(_$SkyInfoModelImpl) then) =
      __$$SkyInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSky, int averageConf});
}

/// @nodoc
class __$$SkyInfoModelImplCopyWithImpl<$Res>
    extends _$SkyInfoModelCopyWithImpl<$Res, _$SkyInfoModelImpl>
    implements _$$SkyInfoModelImplCopyWith<$Res> {
  __$$SkyInfoModelImplCopyWithImpl(
      _$SkyInfoModelImpl _value, $Res Function(_$SkyInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkyInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSky = null,
    Object? averageConf = null,
  }) {
    return _then(_$SkyInfoModelImpl(
      isSky: null == isSky
          ? _value.isSky
          : isSky // ignore: cast_nullable_to_non_nullable
              as bool,
      averageConf: null == averageConf
          ? _value.averageConf
          : averageConf // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SkyInfoModelImpl extends _SkyInfoModel {
  const _$SkyInfoModelImpl({required this.isSky, required this.averageConf})
      : super._();

  factory _$SkyInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkyInfoModelImplFromJson(json);

  @override
  final bool isSky;
  @override
  final int averageConf;

  @override
  String toString() {
    return 'SkyInfoModel(isSky: $isSky, averageConf: $averageConf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkyInfoModelImpl &&
            (identical(other.isSky, isSky) || other.isSky == isSky) &&
            (identical(other.averageConf, averageConf) ||
                other.averageConf == averageConf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isSky, averageConf);

  /// Create a copy of SkyInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkyInfoModelImplCopyWith<_$SkyInfoModelImpl> get copyWith =>
      __$$SkyInfoModelImplCopyWithImpl<_$SkyInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkyInfoModelImplToJson(
      this,
    );
  }
}

abstract class _SkyInfoModel extends SkyInfoModel {
  const factory _SkyInfoModel(
      {required final bool isSky,
      required final int averageConf}) = _$SkyInfoModelImpl;
  const _SkyInfoModel._() : super._();

  factory _SkyInfoModel.fromJson(Map<String, dynamic> json) =
      _$SkyInfoModelImpl.fromJson;

  @override
  bool get isSky;
  @override
  int get averageConf;

  /// Create a copy of SkyInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkyInfoModelImplCopyWith<_$SkyInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
