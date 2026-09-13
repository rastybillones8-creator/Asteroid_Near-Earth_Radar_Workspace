import 'exceptions.dart';

class Asteroid {
  final String id;
  final String name;
  final double primaryValue;
  final double velocityKph;
  final bool isPotentiallyHazardous;

  const Asteroid({
    required this.id,
    required this.name,
    required this.primaryValue,
    this.velocityKph = 0.0,
    this.isPotentiallyHazardous = false,
  });

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String parsedId,
        'name': String parsedName,
        'absolute_magnitude_h': num magnitude,
      } =>
        Asteroid(
          id: parsedId,
          name: parsedName,
          primaryValue: magnitude.toDouble(),
          velocityKph: _parseVelocity(json),
          isPotentiallyHazardous: _parseHazardousStatus(json),
        ),
      _ => throw AsteroidException('Payload failed pattern validation check!'),
    };
  }

  static double _parseVelocity(Map<String, dynamic> json) {
    final approachData = json['close_approach_data'];

    if (approachData is List && approachData.isNotEmpty) {
      final firstApproach = approachData.first;

      if (firstApproach is Map<String, dynamic>) {
        final relativeVelocity = firstApproach['relative_velocity'];

        if (relativeVelocity is Map<String, dynamic>) {
          final kilometersPerHour = relativeVelocity['kilometers_per_hour'];

          if (kilometersPerHour is num) {
            return kilometersPerHour.toDouble();
          }

          if (kilometersPerHour is String) {
            return double.tryParse(kilometersPerHour) ?? 0.0;
          }
        }
      }
    }

    return 0.0;
  }

  static bool _parseHazardousStatus(Map<String, dynamic> json) {
    final value = json['is_potentially_hazardous_asteroid'];

    return value is bool ? value : false;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'absolute_magnitude_h': primaryValue,
      'velocity_kph': velocityKph,
      'is_potentially_hazardous_asteroid': isPotentiallyHazardous,
    };
  }
}
