import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/sky_photo.dart';
import '../../domain/entities/photo_match.dart';
import '../../domain/repositories/photo.dart';
import '../../data/repositories/photo_impl.dart';
import 'user_provider.dart';

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return PhotoRepositoryImpl(ref.watch(supabaseDataSourceProvider));
});

class PhotoState {
  final List<SkyPhoto> photos;
  final SkyPhoto? latestPhoto;
  final SkyPhoto? latestMatchedPhoto;
  final bool isLoading;
  final String? error;

  PhotoState({
    this.photos = const [],
    this.latestPhoto,
    this.latestMatchedPhoto,
    this.isLoading = false,
    this.error,
  });

  PhotoState copyWith({
    List<SkyPhoto>? photos,
    SkyPhoto? latestPhoto,
    SkyPhoto? latestMatchedPhoto,
    bool? isLoading,
    String? error,
  }) {
    return PhotoState(
      photos: photos ?? this.photos,
      latestPhoto: latestPhoto ?? this.latestPhoto,
      latestMatchedPhoto: latestMatchedPhoto ?? this.latestMatchedPhoto,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class PhotoNotifier extends StateNotifier<PhotoState> {
  final PhotoRepository repository;

  PhotoNotifier(this.repository) : super(PhotoState());

  Future<void> uploadPhoto({
    required String userId,
    required String imagePath,
    required String weatherId,
  }) async {
    final result = await repository.uploadPhoto(
      userId: userId,
      imagePath: imagePath,
      weatherId: weatherId,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (photo) {
        state = state.copyWith(
          latestPhoto: photo,
          photos: [photo, ...state.photos],
          isLoading: false,
          error: null,
        );
      },
    );
  }

  Future<List<SkyPhoto>?> loadUserPhotos(String userId) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await repository.getUserPhotos(userId);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
        return null;
      },
      (photos) {
        state = state.copyWith(
          photos: photos,
          isLoading: false,
          error: null,
        );
        return photos;
      },
    );
  }

  Future<SkyPhoto?> loadLatestTodayPhoto(String userId) async {
    final result = await repository.getLatestUserTodayPhoto(userId);

    return result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
        return null;
      },
      (photo) {
        if (photo != null) {
          state = state.copyWith(latestPhoto: photo);
          return photo;
        }

        return null;
      },
    );
  }

  Future<SkyPhoto?> loadMatchedPhoto(String userPhotoId) async {
    final result = await repository.getMatchedPhoto(userPhotoId);

    return result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
        return null;
      },
      (matchedPhoto) {
        state = state.copyWith(latestMatchedPhoto: matchedPhoto);
        return matchedPhoto;
      },
    );
  }

  Future<void> loadPhotosByMonth(String userId, int year, int month) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await repository.getPhotosByMonth(userId, year, month);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (photos) {
        state = state.copyWith(
          photos: photos,
          isLoading: false,
          error: null,
        );
      },
    );
  }

  Future<SkyPhoto?> getTodayPhotoByOtherUser(String currentUserId) async {
    final result = await repository.getTodayPhotoByOtherUser(currentUserId);

    return result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
        return null;
      },
      (photo) => photo,
    );
  }

  Future<PhotoMatch?> saveMatchedPhotos({
    required String userPhotoId,
    required String matchedPhotoId,
  }) async {
    final result = await repository.saveMatchedPhotos(
      userPhotoId: userPhotoId,
      matchedPhotoId: matchedPhotoId,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
        return null;
      },
      (match) {
        return match;
      },
    );
  }
}

final photoProvider = StateNotifierProvider<PhotoNotifier, PhotoState>((ref) {
  return PhotoNotifier(ref.watch(photoRepositoryProvider));
});
