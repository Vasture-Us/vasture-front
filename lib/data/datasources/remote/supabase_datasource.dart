import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/config/supabase_config.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/error/exceptions.dart';
import '../../models/user.dart';
import '../../models/sky_photo.dart';
import '../../models/weather.dart';
import '../../models/photo_match.dart';
import 'dart:io';

// TODO: Folderに分けたい
class SupabaseDataSource {
  final SupabaseClient client = SupabaseConfig.client;

  Future<UserModel> getUser(String id) async {
    try {
      final response = await client
          .from(AppConstants.usersTable)
          .select()
          .eq('id', id)
          .single();

      return UserModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to get user: ${e.toString()}');
    }
  }

  Future<UserModel> createUser(String id) async {
    try {
      final response = await client
          .from(AppConstants.usersTable)
          .insert({
            'id': id,
            'created_at': DateTime.now().toIso8601String(),
          })
          .select()
          .single();

      return UserModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to create user: ${e.toString()}');
    }
  }

  Future<SkyPhotoModel> uploadPhoto({
    required String userId,
    required File imageFile,
    required String weatherId,
  }) async {
    try {
      final fileName = '${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final filePath = '$userId/$fileName';

      await client.storage
          .from(AppConstants.skyPhotosBucket)
          .upload(filePath, imageFile);

      final imageUrl = client.storage
          .from(AppConstants.skyPhotosBucket)
          .getPublicUrl(filePath);

      final response = await client
          .from(AppConstants.skyPhotosTable)
          .insert({
            'user_id': userId,
            'image_url': imageUrl,
            'weather_id': weatherId,
          })
          .select()
          .single();

      return SkyPhotoModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to upload photo: ${e.toString()}');
    }
  }

  Future<SkyPhotoModel> getPhotoById(String id) async {
    try {
      final response = await client
          .from(AppConstants.skyPhotosTable)
          .select()
          .eq('id', id)
          .single();

      return SkyPhotoModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to get photo: ${e.toString()}');
    }
  }

  Future<List<SkyPhotoModel>> getUserPhotos(String userId) async {
    try {
      final response = await client
          .from(AppConstants.skyPhotosTable)
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List).map((e) => SkyPhotoModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException('Failed to get user photos: ${e.toString()}');
    }
  }

  Future<List<SkyPhotoModel>> getPhotosByMonth(
      String userId, int year, int month) async {
    try {
      final startDate = DateTime(year, month, 1);
      final endDate = DateTime(year, month + 1, 1);

      final response = await client
          .from(AppConstants.skyPhotosTable)
          .select()
          .eq('user_id', userId)
          .gte('created_at', startDate.toIso8601String())
          .lt('created_at', endDate.toIso8601String())
          .order('created_at', ascending: false);

      return (response as List).map((e) => SkyPhotoModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException('Failed to get photos by month: ${e.toString()}');
    }
  }

  Future<SkyPhotoModel?> getMatchedPhoto(String userPhotoId) async {
    try {
      final response = await client
          .from(AppConstants.photoMatchesTable)
          .select()
          .eq('user_photo_id', userPhotoId)
          .maybeSingle();

      if (response == null) return null;

      final photoMatchData = PhotoMatchModel.fromJson(response);

      final skyPhotoRes = await client
          .from(AppConstants.skyPhotosTable)
          .select()
          .eq('id', photoMatchData.matchedPhotoId)
          .single();

      return SkyPhotoModel.fromJson(skyPhotoRes);
    } catch (e) {
      throw ServerException('Failed to get photo match: ${e.toString()}');
    }
  }

  Future<SkyPhotoModel?> getLatestUserTodayPhoto(String userId) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final response = await client
          .from(AppConstants.skyPhotosTable)
          .select()
          .eq('user_id', userId)
          .gte('created_at', startOfDay.toIso8601String())
          .lt('created_at', endOfDay.toIso8601String())
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();

      if (response == null) return null;

      return SkyPhotoModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to get latest photo: ${e.toString()}');
    }
  }

  Future<WeatherModel> saveWeather({
    required String condition,
    required double temperature,
    required String location,
  }) async {
    try {
      final response = await client
          .from(AppConstants.weatherTable)
          .insert({
            'condition': condition,
            'temperature': temperature,
            'location': location,
          })
          .select()
          .single();

      return WeatherModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to save weather: ${e.toString()}');
    }
  }

  Future<SkyPhotoModel?> getTodayPhotoByOtherUser(String currentUserId) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final response = await client
          .from(AppConstants.skyPhotosTable)
          .select()
          .neq('user_id', currentUserId)
          .gte('created_at', startOfDay.toIso8601String())
          .lt('created_at', endOfDay.toIso8601String());
      // .limit(1)
      // .maybeSingle();
      // NOTE: ランダムにする
      response.shuffle();

      final randomRes = response.firstOrNull;

      if (randomRes == null) return null;

      return SkyPhotoModel.fromJson(randomRes);
    } catch (e) {
      throw ServerException('Failed to get today photo: ${e.toString()}');
    }
  }

  Future<PhotoMatchModel> saveMatchedPhotos({
    required String userPhotoId,
    required String matchedPhotoId,
  }) async {
    try {
      final response = await client
          .from(AppConstants.photoMatchesTable)
          .insert({
            'user_photo_id': userPhotoId,
            'matched_photo_id': matchedPhotoId,
          })
          .select()
          .single();

      return PhotoMatchModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to save matched photos: ${e.toString()}');
    }
  }
}
