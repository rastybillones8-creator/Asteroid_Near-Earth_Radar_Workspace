import 'package:asteroid_api/asteroid_api.dart';
import 'package:test/test.dart';

void main() {
  test('Asteroid.fromJson deserializes valid JSON', () {
    final asteroid = Asteroid.fromJson({
      'id': '12345',
      'name': 'Test Asteroid',
      'absolute_magnitude_h': 20.5,
    });

    expect(asteroid.id, '12345');
    expect(asteroid.name, 'Test Asteroid');
    expect(asteroid.primaryValue, 20.5);
  });

  test('Asteroid.fromJson rejects invalid JSON', () {
    expect(
      () => Asteroid.fromJson({
        'id': 12345,
        'name': 'Invalid',
        'absolute_magnitude_h': 'wrong',
      }),
      throwsA(isA<AsteroidException>()),
    );
  });

  test('AsteroidException includes underlying cause', () {
    final exception = AsteroidException('Request failed', 'timeout');

    expect(
      exception.toString(),
      'AsteroidException: Request failed (Underlying: timeout)',
    );
  });
}
