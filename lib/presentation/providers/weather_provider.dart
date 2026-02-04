import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather.dart';
import '../../data/repositories/weather_impl.dart';
import '../../data/datasources/remote/weather_api_datasource.dart';
import 'user_provider.dart';

// NOTE: 天気情報を取得、保存するためのProviderたち
final weatherApiDataSourceProvider = Provider<WeatherApiDataSource>((ref) {
  return WeatherApiDataSource(Client());
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(
    apiDataSource: ref.watch(weatherApiDataSourceProvider),
    supabaseDataSource: ref.watch(supabaseDataSourceProvider),
  );
});

class WeatherState {
  final Weather? weather;
  final bool isLoading;
  final String? error;

  WeatherState({
    this.weather,
    this.isLoading = false,
    this.error,
  });

  WeatherState copyWith({
    Weather? weather,
    bool? isLoading,
    String? error,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class WeatherNotifier extends StateNotifier<WeatherState> {
  final WeatherRepository repository;

  WeatherNotifier(this.repository) : super(WeatherState());

  Future<void> fetchCurrentWeather() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final position = await _getCurrentPosition();
      final result = await repository.getCurrentWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (weather) {
          state = state.copyWith(
            weather: weather,
            isLoading: false,
            error: null,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<Weather?> saveCurrentWeather() async {
    final current = state.weather;
    if (current == null) return null;

    final result = await repository.saveWeather(
      condition: current.condition,
      temperature: current.temperature,
      location: current.location,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
        return null;
      },
      (weather) {
        state = state.copyWith(weather: weather, error: null);
        return weather;
      },
    );
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}

final weatherProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  return WeatherNotifier(ref.watch(weatherRepositoryProvider));
});
