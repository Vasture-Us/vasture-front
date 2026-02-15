import 'package:freezed_annotation/freezed_annotation.dart';

part 'sky_info.freezed.dart';
part 'sky_info.g.dart';

@freezed
class SkyInfoModel with _$SkyInfoModel {
  const SkyInfoModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SkyInfoModel({
    required bool isSky,
    required int averageConf,
  }) = _SkyInfoModel;

  factory SkyInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SkyInfoModelFromJson(json);
}
