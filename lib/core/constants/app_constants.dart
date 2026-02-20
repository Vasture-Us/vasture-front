// NOTE: アプリ内で使う定数たち
class AppConstants {
  static const String userIdKey = 'user_id';
  static const String tutorialCompletedKey = 'tutorial_completed';
  static const String lastSyncTimestampKey = 'last_sync_timestamp';

  static const String usersTable = 'users';
  static const String skyPhotosTable = 'sky_photos';
  static const String weatherTable = 'weather';
  static const String photoMatchesTable = 'photo_matches';

  static const String skyPhotosBucket = 'sky-photos';

  static const String privacyPolicyUrl =
      'https://docs.google.com/document/d/16OBOQDjyxPhA13RuxCtbkc2OfDUioJyNYeSc99m6eFc/edit?hl=ja&tab=t.0';
  static const String termsOfServiceUrl = 'https://docs.google.com/document/d/16OBOQDjyxPhA13RuxCtbkc2OfDUioJyNYeSc99m6eFc/edit?hl=ja&tab=t.xgafvhhcetg1';

  static const Duration apiTimeout = Duration(seconds: 30);

  static const int maxImageSizeBytes = 10 * 1024 * 1024; // 10MB
  static const double imageQuality = 0.8;

  static const int photosPerPage = 20;
}
