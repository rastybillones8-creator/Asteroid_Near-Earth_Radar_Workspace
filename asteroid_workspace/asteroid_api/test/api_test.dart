import 'package:asteroid_api/asteroid_api.dart';
import 'package:test/test.dart';

void main() {
  group('Asteroid Model Deserialisation Suite', () {
    test('Successful parsing of NASA NeoWs payload', () {
      final mockJson = {
        'id': '3542519',
        'name': '(2010 PK9)',
        'absolute_magnitude_h': 21.5,
        'is_potentially_hazardous_asteroid': true,
        'close_approach_data': [
          {
            'relative_velocity': {
              'kilometers_per_hour': '65000.50',
            },
          },
        ],
      };

      final item = Asteroid.fromJson(mockJson);

      expect(item.id, equals('3542519'));
      expect(item.name, equals('(2010 PK9)'));
      expect(item.primaryValue, equals(21.5));
      expect(item.velocityKph, equals(65000.50));
      expect(item.isPotentiallyHazardous, isTrue);
    });

    test('Broken NASA payload throws AsteroidException', () {
      final malformedJson = {
        'id': 'ID-1002',
      };

      expect(
        () => Asteroid.fromJson(malformedJson),
        throwsA(isA<AsteroidException>()),
      );
    });
  });
}