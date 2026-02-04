import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vasture/data/models/wx.dart';
import '../../../core/config/app_config.dart';
import '../../../core/error/exceptions.dart';

class WeatherApiDataSource {
  final http.Client client;

  WeatherApiDataSource(this.client);

  Future<WxModel> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final url = Uri.parse(
        '${AppConfig.weatherApiUrl}?lat=$latitude&lon=$longitude',
      );

      final response = await client.get(url, headers: {
        'X-Api-Key': AppConfig.weatherApiKey,
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return WxModel.fromJson(data);
      } else {
        throw ServerException('Failed to fetch weather data');
      }
    } catch (e) {
      throw NetworkException('Network error: ${e.toString()}');
    }
  }
}
