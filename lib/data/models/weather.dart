import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/weather.dart' as entity;

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const WeatherModel._();

  const factory WeatherModel({
    required String id,
    required String condition,
    required double temperature,
    required String location,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  factory WeatherModel.fromEntity(entity.Weather weather) {
    return WeatherModel(
      id: weather.id,
      condition: weather.condition,
      temperature: weather.temperature,
      location: weather.location,
      createdAt: weather.createdAt,
    );
  }

  entity.Weather toEntity() {
    return entity.Weather(
      id: id,
      condition: condition,
      temperature: temperature,
      location: location,
      createdAt: createdAt,
    );
  }
}
