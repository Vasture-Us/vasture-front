import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/initialize_user.dart';
import '../../data/repositories/user_impl.dart';
import '../../data/datasources/local/shared_prefs_datasource.dart';
import '../../data/datasources/remote/supabase_datasource.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

final sharedPrefsDataSourceProvider = Provider<SharedPrefsDataSource>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);

  return SharedPrefsDataSource(prefs);
});

final supabaseDataSourceProvider = Provider<SupabaseDataSource>((ref) {
  return SupabaseDataSource();
});

final userRepositoryProvider = Provider((ref) {
  return UserRepositoryImpl(
    remoteDataSource: ref.watch(supabaseDataSourceProvider),
    localDataSource: ref.watch(sharedPrefsDataSourceProvider),
  );
});

final initializeUserUseCaseProvider = Provider((ref) {
  return InitializeUser(ref.watch(userRepositoryProvider));
});

class UserState {
  final User? user;
  final bool isLoading;
  final String? error;

  UserState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  UserState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// User notifier
class UserNotifier extends StateNotifier<UserState> {
  final InitializeUser initializeUser;

  UserNotifier(this.initializeUser) : super(UserState());

  Future<void> initialize() async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await initializeUser();

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (user) {
        state = state.copyWith(
          user: user,
          isLoading: false,
          error: null,
        );
      },
    );
  }
}

// User provider
final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.watch(initializeUserUseCaseProvider));
});
