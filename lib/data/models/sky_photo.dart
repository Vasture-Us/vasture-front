import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sky_photo.dart' as entity;

part 'sky_photo.freezed.dart';
part 'sky_photo.g.dart';

@freezed
class SkyPhotoModel with _$SkyPhotoModel {
  const SkyPhotoModel._();

  const factory SkyPhotoModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'weather_id') required String? weatherId,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _SkyPhotoModel;

  factory SkyPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$SkyPhotoModelFromJson(json);

  factory SkyPhotoModel.fromEntity(entity.SkyPhoto photo) {
    return SkyPhotoModel(
      id: photo.id,
      userId: photo.userId,
      imageUrl: photo.imageUrl,
      createdAt: photo.createdAt,
      weatherId: photo.weatherId,
    );
  }

  entity.SkyPhoto toEntity() {
    return entity.SkyPhoto(
      id: id,
      userId: userId,
      imageUrl: imageUrl,
      createdAt: createdAt,
      weatherId: weatherId,
    );
  }
}
