import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/error/exceptions.dart';

class SharedPrefsDataSource {
  final SharedPreferences sharedPreferences;

  SharedPrefsDataSource(this.sharedPreferences);

  Future<String> getUserId() async {
    final userId = sharedPreferences.getString(AppConstants.userIdKey);
    if (userId == null) {
      throw CacheException('User ID not found in local storage');
    }
    return userId;
  }

  Future<String> getUserIdFromRouter() async {
    final userId = sharedPreferences.getString(AppConstants.userIdKey);
    if (userId == null) {
      return '';
    }
    return userId;
  }

  Future<void> saveUserId(String userId) async {
    final success =
        await sharedPreferences.setString(AppConstants.userIdKey, userId);
    if (!success) {
      throw CacheException('Failed to save user ID');
    }
  }
  Future<void> clear() async {
    final success = await sharedPreferences.clear();
    if (!success) {
      throw CacheException('Failed to clear user ID');
    }
  }

  Future<bool> isTutorialCompleted() async {
    return sharedPreferences.getBool(AppConstants.tutorialCompletedKey) ??
        false;
  }

  Future<void> setTutorialCompleted(bool completed) async {
    final success = await sharedPreferences.setBool(
      AppConstants.tutorialCompletedKey,
      completed,
    );
    if (!success) {
      throw CacheException('Failed to save tutorial status');
    }
  }

  Future<int?> getLastSyncTimestamp() async {
    return sharedPreferences.getInt(AppConstants.lastSyncTimestampKey);
  }

  Future<void> setLastSyncTimestamp(int timestamp) async {
    final success = await sharedPreferences.setInt(
      AppConstants.lastSyncTimestampKey,
      timestamp,
    );
    if (!success) {
      throw CacheException('Failed to save sync timestamp');
    }
  }
}
