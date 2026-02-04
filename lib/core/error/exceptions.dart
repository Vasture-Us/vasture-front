class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException(this.message);
}

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);
}

class LocationException implements Exception {
  final String message;

  LocationException(this.message);
}

class CameraException implements Exception {
  final String message;

  CameraException(this.message);
}

class StorageException implements Exception {
  final String message;

  StorageException(this.message);
}
