class Weather {
  final String id;
  final String condition;
  final double temperature;
  final String location;
  final DateTime createdAt;

  const Weather({
    required this.id,
    required this.condition,
    required this.temperature,
    required this.location,
    required this.createdAt,
  });
}
