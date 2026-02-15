import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vasture/core/config/app_config.dart';
import 'package:vasture/data/datasources/remote/sky_model_api_datasource.dart';
import 'package:vasture/data/models/sky_info.dart';
import 'package:vasture/data/repositories/sky_model_impl.dart';
import 'package:vasture/domain/repositories/sky_model.dart';

final skyModelApiDataSourceProvider = Provider<SkyModelApiDatasource>((ref) {
  return SkyModelApiDatasource(Dio(BaseOptions(baseUrl: AppConfig.skyModelApiUrl)));
});

final skyModelRepositoryProvider = Provider<SkyModelRepository>((ref) {
  return SkyModelRepositoryImpl(
    dataSource: ref.watch(skyModelApiDataSourceProvider),
  );
});

class SkyInfoState {
  final SkyInfoModel? skyInfo;
  final bool isLoading;
  final String? error;

  SkyInfoState({
    this.skyInfo,
    this.isLoading = false,
    this.error,
  });

  SkyInfoState copyWith({
    SkyInfoModel? skyInfo,
    bool? isLoading,
    String? error,
  }) {
    return SkyInfoState(
      skyInfo: skyInfo ?? this.skyInfo,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class SkyInfoNotifier extends StateNotifier<SkyInfoState> {
  final SkyModelRepository repository;

  SkyInfoNotifier(this.repository) : super(SkyInfoState());

  Future<void> fetchSkyImageInfo(File image) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await repository.getSkyImageInfo(image: image);

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (skyInfo) {
          state = state.copyWith(
            skyInfo: skyInfo,
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
}

final skyInfoProvider =
    StateNotifierProvider<SkyInfoNotifier, SkyInfoState>((ref) {
  return SkyInfoNotifier(ref.watch(skyModelRepositoryProvider));
});
