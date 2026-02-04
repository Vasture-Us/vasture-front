import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/shared_prefs_datasource.dart';
import 'user_provider.dart';

class TutorialState {
  final bool isCompleted;
  final bool isLoading;
  final String? error;

  TutorialState({
    this.isCompleted = false,
    this.isLoading = false,
    this.error,
  });

  TutorialState copyWith({
    bool? isCompleted,
    bool? isLoading,
    String? error,
  }) {
    return TutorialState(
      isCompleted: isCompleted ?? this.isCompleted,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class TutorialNotifier extends StateNotifier<TutorialState> {
  final SharedPrefsDataSource dataSource;

  TutorialNotifier(this.dataSource) : super(TutorialState()) {
    _loadTutorialStatus();
  }

  Future<void> _loadTutorialStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final isCompleted = await dataSource.isTutorialCompleted();
      state = state.copyWith(isCompleted: isCompleted, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> completeTutorial() async {
    try {
      await dataSource.setTutorialCompleted(true);
      state = state.copyWith(isCompleted: true);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

final tutorialProvider = StateNotifierProvider<TutorialNotifier, TutorialState>((ref) {
  return TutorialNotifier(ref.watch(sharedPrefsDataSourceProvider));
});
