// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sky_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkyPhotoModel _$SkyPhotoModelFromJson(Map<String, dynamic> json) {
  return _SkyPhotoModel.fromJson(json);
}

/// @nodoc
mixin _$SkyPhotoModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_id')
  String? get weatherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SkyPhotoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkyPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkyPhotoModelCopyWith<SkyPhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkyPhotoModelCopyWith<$Res> {
  factory $SkyPhotoModelCopyWith(
          SkyPhotoModel value, $Res Function(SkyPhotoModel) then) =
      _$SkyPhotoModelCopyWithImpl<$Res, SkyPhotoModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'weather_id') String? weatherId,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$SkyPhotoModelCopyWithImpl<$Res, $Val extends SkyPhotoModel>
    implements $SkyPhotoModelCopyWith<$Res> {
  _$SkyPhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkyPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? weatherId = freezed,
    Object? imageUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      weatherId: freezed == weatherId
          ? _value.weatherId
          : weatherId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkyPhotoModelImplCopyWith<$Res>
    implements $SkyPhotoModelCopyWith<$Res> {
  factory _$$SkyPhotoModelImplCopyWith(
          _$SkyPhotoModelImpl value, $Res Function(_$SkyPhotoModelImpl) then) =
      __$$SkyPhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'weather_id') String? weatherId,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$SkyPhotoModelImplCopyWithImpl<$Res>
    extends _$SkyPhotoModelCopyWithImpl<$Res, _$SkyPhotoModelImpl>
    implements _$$SkyPhotoModelImplCopyWith<$Res> {
  __$$SkyPhotoModelImplCopyWithImpl(
      _$SkyPhotoModelImpl _value, $Res Function(_$SkyPhotoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkyPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? weatherId = freezed,
    Object? imageUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_$SkyPhotoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      weatherId: freezed == weatherId
          ? _value.weatherId
          : weatherId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkyPhotoModelImpl extends _SkyPhotoModel {
  const _$SkyPhotoModelImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'weather_id') required this.weatherId,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'created_at') required this.createdAt})
      : super._();

  factory _$SkyPhotoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkyPhotoModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'weather_id')
  final String? weatherId;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'SkyPhotoModel(id: $id, userId: $userId, weatherId: $weatherId, imageUrl: $imageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkyPhotoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.weatherId, weatherId) ||
                other.weatherId == weatherId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, weatherId, imageUrl, createdAt);

  /// Create a copy of SkyPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkyPhotoModelImplCopyWith<_$SkyPhotoModelImpl> get copyWith =>
      __$$SkyPhotoModelImplCopyWithImpl<_$SkyPhotoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkyPhotoModelImplToJson(
      this,
    );
  }
}

abstract class _SkyPhotoModel extends SkyPhotoModel {
  const factory _SkyPhotoModel(
          {required final String id,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'weather_id') required final String? weatherId,
          @JsonKey(name: 'image_url') required final String imageUrl,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$SkyPhotoModelImpl;
  const _SkyPhotoModel._() : super._();

  factory _SkyPhotoModel.fromJson(Map<String, dynamic> json) =
      _$SkyPhotoModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'weather_id')
  String? get weatherId;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of SkyPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkyPhotoModelImplCopyWith<_$SkyPhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
