// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotoMatchModel _$PhotoMatchModelFromJson(Map<String, dynamic> json) {
  return _PhotoMatchModel.fromJson(json);
}

/// @nodoc
mixin _$PhotoMatchModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_photo_id')
  String get userPhotoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'matched_photo_id')
  String get matchedPhotoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'matched_at')
  DateTime get matchedAt => throw _privateConstructorUsedError;

  /// Serializes this PhotoMatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotoMatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoMatchModelCopyWith<PhotoMatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoMatchModelCopyWith<$Res> {
  factory $PhotoMatchModelCopyWith(
          PhotoMatchModel value, $Res Function(PhotoMatchModel) then) =
      _$PhotoMatchModelCopyWithImpl<$Res, PhotoMatchModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_photo_id') String userPhotoId,
      @JsonKey(name: 'matched_photo_id') String matchedPhotoId,
      @JsonKey(name: 'matched_at') DateTime matchedAt});
}

/// @nodoc
class _$PhotoMatchModelCopyWithImpl<$Res, $Val extends PhotoMatchModel>
    implements $PhotoMatchModelCopyWith<$Res> {
  _$PhotoMatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoMatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userPhotoId = null,
    Object? matchedPhotoId = null,
    Object? matchedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoId: null == userPhotoId
          ? _value.userPhotoId
          : userPhotoId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedPhotoId: null == matchedPhotoId
          ? _value.matchedPhotoId
          : matchedPhotoId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _value.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoMatchModelImplCopyWith<$Res>
    implements $PhotoMatchModelCopyWith<$Res> {
  factory _$$PhotoMatchModelImplCopyWith(_$PhotoMatchModelImpl value,
          $Res Function(_$PhotoMatchModelImpl) then) =
      __$$PhotoMatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_photo_id') String userPhotoId,
      @JsonKey(name: 'matched_photo_id') String matchedPhotoId,
      @JsonKey(name: 'matched_at') DateTime matchedAt});
}

/// @nodoc
class __$$PhotoMatchModelImplCopyWithImpl<$Res>
    extends _$PhotoMatchModelCopyWithImpl<$Res, _$PhotoMatchModelImpl>
    implements _$$PhotoMatchModelImplCopyWith<$Res> {
  __$$PhotoMatchModelImplCopyWithImpl(
      _$PhotoMatchModelImpl _value, $Res Function(_$PhotoMatchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoMatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userPhotoId = null,
    Object? matchedPhotoId = null,
    Object? matchedAt = null,
  }) {
    return _then(_$PhotoMatchModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoId: null == userPhotoId
          ? _value.userPhotoId
          : userPhotoId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedPhotoId: null == matchedPhotoId
          ? _value.matchedPhotoId
          : matchedPhotoId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _value.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoMatchModelImpl extends _PhotoMatchModel {
  const _$PhotoMatchModelImpl(
      {required this.id,
      @JsonKey(name: 'user_photo_id') required this.userPhotoId,
      @JsonKey(name: 'matched_photo_id') required this.matchedPhotoId,
      @JsonKey(name: 'matched_at') required this.matchedAt})
      : super._();

  factory _$PhotoMatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoMatchModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_photo_id')
  final String userPhotoId;
  @override
  @JsonKey(name: 'matched_photo_id')
  final String matchedPhotoId;
  @override
  @JsonKey(name: 'matched_at')
  final DateTime matchedAt;

  @override
  String toString() {
    return 'PhotoMatchModel(id: $id, userPhotoId: $userPhotoId, matchedPhotoId: $matchedPhotoId, matchedAt: $matchedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoMatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userPhotoId, userPhotoId) ||
                other.userPhotoId == userPhotoId) &&
            (identical(other.matchedPhotoId, matchedPhotoId) ||
                other.matchedPhotoId == matchedPhotoId) &&
            (identical(other.matchedAt, matchedAt) ||
                other.matchedAt == matchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userPhotoId, matchedPhotoId, matchedAt);

  /// Create a copy of PhotoMatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoMatchModelImplCopyWith<_$PhotoMatchModelImpl> get copyWith =>
      __$$PhotoMatchModelImplCopyWithImpl<_$PhotoMatchModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoMatchModelImplToJson(
      this,
    );
  }
}

abstract class _PhotoMatchModel extends PhotoMatchModel {
  const factory _PhotoMatchModel(
      {required final String id,
      @JsonKey(name: 'user_photo_id') required final String userPhotoId,
      @JsonKey(name: 'matched_photo_id') required final String matchedPhotoId,
      @JsonKey(name: 'matched_at')
      required final DateTime matchedAt}) = _$PhotoMatchModelImpl;
  const _PhotoMatchModel._() : super._();

  factory _PhotoMatchModel.fromJson(Map<String, dynamic> json) =
      _$PhotoMatchModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_photo_id')
  String get userPhotoId;
  @override
  @JsonKey(name: 'matched_photo_id')
  String get matchedPhotoId;
  @override
  @JsonKey(name: 'matched_at')
  DateTime get matchedAt;

  /// Create a copy of PhotoMatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoMatchModelImplCopyWith<_$PhotoMatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
