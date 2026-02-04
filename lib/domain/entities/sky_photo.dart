class SkyPhoto {
  final String id;
  final String userId;
  final String imageUrl;
  final DateTime createdAt;
  final String? weatherId;

  const SkyPhoto({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.createdAt,
    this.weatherId,
  });
}
