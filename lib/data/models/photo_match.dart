import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/photo_match.dart' as entity;

part 'photo_match.freezed.dart';
part 'photo_match.g.dart';

@freezed
class PhotoMatchModel with _$PhotoMatchModel {
  const PhotoMatchModel._();

  const factory PhotoMatchModel({
    required String id,
    required String userPhotoId,
    required String matchedPhotoId,
    @JsonKey(name: 'matched_at') required DateTime matchedAt,
  }) = _PhotoMatchModel;

  factory PhotoMatchModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoMatchModelFromJson(json);

  factory PhotoMatchModel.fromEntity(entity.PhotoMatch match) {
    return PhotoMatchModel(
      id: match.id,
      userPhotoId: match.userPhotoId,
      matchedPhotoId: match.matchedPhotoId,
      matchedAt: match.matchedAt,
    );
  }

  entity.PhotoMatch toEntity() {
    return entity.PhotoMatch(
      id: id,
      userPhotoId: userPhotoId,
      matchedPhotoId: matchedPhotoId,
      matchedAt: matchedAt,
    );
  }
}
