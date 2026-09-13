import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'exceptions.dart';
import 'models.dart';

class AsteroidApiClient {
  final http.Client _client;
  final Logger _logger = Logger('AsteroidApiClient');

  static const String _authority = 'api.nasa.gov';

  AsteroidApiClient(this._client);

  Future<Asteroid> fetchMetadata(String query) async {
    _logger.info('Initiating connection for asteroid query: $query');

    final uri = Uri.https(_authority, '/neo/rest/v1/neo/$query', {
      'api_key': 'DEMO_KEY',
    });

    try {
      final response = await _client
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
              'User-Agent': 'Asteroid-Near-Earth-Radar/1.0',
            },
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode != 200) {
        _logger.warning(
          'API responded with error status: ${response.statusCode}',
        );

        throw AsteroidException(
          'Remote server rejected transaction '
          '(HTTP ${response.statusCode}).',
        );
      }

      final decoded = json.decode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw AsteroidException('Unexpected JSON response payload structure.');
      }

      return Asteroid.fromJson(decoded);
    } on http.ClientException catch (e) {
      _logger.severe('Network socket transaction failed.', e);

      throw AsteroidException('Network communication failure occurred.', e);
    } catch (e) {
      _logger.severe('An unexpected processing failure was intercepted.', e);

      rethrow;
    } finally {
      _logger.info('Asteroid API request lifecycle completed.');
    }
  }

  void close() {
    _client.close();
    _logger.info('HTTP client closed.');
  }
}
