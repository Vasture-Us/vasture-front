import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart' as entity;

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(entity.User user) {
    return UserModel(
      id: user.id,
      createdAt: user.createdAt,
    );
  }

  entity.User toEntity() {
    return entity.User(
      id: id,
      createdAt: createdAt,
    );
  }
}
