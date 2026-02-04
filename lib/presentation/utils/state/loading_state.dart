import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_state.g.dart';

@Riverpod(keepAlive: true)
class LoadingStateNotifier extends _$LoadingStateNotifier {
  @override
  bool build() {
    return false;
  }

  Future<dynamic> whileLoading(Future<void> Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future())
        .whenComplete(toIdle);
  }

  void toLoading() {
    if (state) {
      return;
    }
    state = true;
  }

  void toIdle() {
    if (!state) {
      return;
    }
    state = false;
  }
}