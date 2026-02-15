import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vasture/core/config/app_config.dart';
import 'package:vasture/presentation/providers/photo_provider.dart';
import 'package:vasture/presentation/providers/user_provider.dart';
import 'package:vasture/presentation/providers/weather_provider.dart';

class PhotoConfirmationResult {
  const PhotoConfirmationResult({
    this.success = false,
    this.errorMessage,
    this.isFirstUserToday = false,
    this.matchedPhotoUrl,
  });

  final bool success;
  final String? errorMessage;
  final bool isFirstUserToday;
  final String? matchedPhotoUrl;

  bool get hasError => errorMessage != null;
}

/// NOTE: 写真確認とマッチング処理を行うサービスクラス
class PhotoConfirmationService {
  const PhotoConfirmationService(this.ref);

  final WidgetRef ref;

  /// NOTE: 空の写真かどうか確認->天気をDBに保存->画像をアップロード->世界の1枚の空を見つける
  Future<PhotoConfirmationResult> confirmAndMatchPhoto(String imagePath) async {
    final userResult = await _initializeUser();
    if (userResult.error != null) {
      return PhotoConfirmationResult(errorMessage: userResult.error);
    }

    final weatherResult = await _fetchAndSaveWeather();
    if (weatherResult.error != null) {
      return PhotoConfirmationResult(errorMessage: weatherResult.error);
    }

    final user = ref.read(userProvider).user!;

    final uploadPhotoResult = await _uploadUserPhoto(
      userId: user.id,
      imagePath: imagePath,
      weatherId: weatherResult.weatherId!,
    );
    if (uploadPhotoResult.error != null) {
      return PhotoConfirmationResult(errorMessage: uploadPhotoResult.error);
    }

    final userPhoto = ref.read(photoProvider).latestPhoto!;

    final matchedPhotoResult = await _matchWithOtherPhoto(
      userId: user.id,
      userPhotoId: userPhoto.id,
    );

    return PhotoConfirmationResult(
      success: true,
      isFirstUserToday: matchedPhotoResult.isFirstUserToday,
      matchedPhotoUrl: matchedPhotoResult.matchedPhotoUrl,
    );
  }

  /// ユーザー情報の初期化
  Future<({String? error})> _initializeUser() async {
    await ref.read(userProvider.notifier).initialize();

    final userState = ref.read(userProvider);
    if (userState.user == null) {
      return (error: 'ユーザー情報の初期化に失敗しました〜\nアプリを再起動してもう一度試してください。');
    }

    return (error: null);
  }

  /// 天気情報の取得と保存
  Future<({String? error, String? weatherId})> _fetchAndSaveWeather() async {
    await ref.read(weatherProvider.notifier).fetchCurrentWeather();
    final weatherState = ref.read(weatherProvider);

    if (weatherState.weather == null) {
      return (error: '天気情報の取得に失敗しました〜\nアプリを再起動してもう一度試してください。', weatherId: null);
    }

    final savedWeather =
        await ref.read(weatherProvider.notifier).saveCurrentWeather();

    if (savedWeather == null) {
      return (error: '天気情報の保存に失敗しました〜\nアプリを再起動してもう一度試してください。', weatherId: null);
    }

    return (error: null, weatherId: savedWeather.id);
  }

  /// 写真のアップロード
  Future<({String? error})> _uploadUserPhoto({
    required String userId,
    required String imagePath,
    required String weatherId,
  }) async {
    await ref.read(photoProvider.notifier).uploadPhoto(
          userId: userId,
          imagePath: imagePath,
          weatherId: weatherId,
        );

    final userPhoto = ref.read(photoProvider).latestPhoto;
    if (userPhoto == null) {
      return (error: '写真のアップロードに失敗しました〜\nアプリを再起動してもう一度試してください。');
    }

    return (error: null);
  }

  /// 他のユーザーの写真とマッチング・保存
  Future<({bool isFirstUserToday, String matchedPhotoUrl})> _matchWithOtherPhoto({
    required String userId,
    required String userPhotoId,
  }) async {
    final otherUserPhoto =
        await ref.read(photoProvider.notifier).getTodayPhotoByOtherUser(userId);

    if (otherUserPhoto == null) {
      // NOTE: 今日空の画像をアップロードする一番最初のユーザーの場合、特別な写真とマッチング
      await ref.read(photoProvider.notifier).saveMatchedPhotos(
            userPhotoId: userPhotoId,
            matchedPhotoId: '548ec0c2-3e9d-4782-83a9-93608117ad06',
          );

      return (isFirstUserToday: true, matchedPhotoUrl: AppConfig.otherImageUrl);
    }

    await ref.read(photoProvider.notifier).saveMatchedPhotos(
          userPhotoId: userPhotoId,
          matchedPhotoId: otherUserPhoto.id,
        );

    return (isFirstUserToday: false, matchedPhotoUrl: otherUserPhoto.imageUrl);
  }
}
