class PhotoMatch {
  final String id;
  final String userPhotoId;
  final String matchedPhotoId;
  final DateTime matchedAt;

  const PhotoMatch({
    required this.id,
    required this.userPhotoId,
    required this.matchedPhotoId,
    required this.matchedAt,
  });
}
