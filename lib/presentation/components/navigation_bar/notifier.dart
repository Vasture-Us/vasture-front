import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

/// NOTE ページのタイプです。並びによってIndexが決まっているのであまり並び替えないでください。
enum ScreenType {
  weather,
  weatherBook,
}

@riverpod
class AppNavigationBarIndex extends _$AppNavigationBarIndex {
  @override
  int build() {
    return ScreenType.weather.index;
  }

  void changePage(ScreenType screenType) {
    state = screenType.index;
  }
}