import 'dart:io';

import 'package:asteroid_api/asteroid_api.dart';
import 'package:asteroid_cli/asteroid_cli.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

Future<void> main(List<String> arguments) async {
  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen((record) {
    stderr.writeln(
      '[${record.level.name}] '
      '${record.loggerName}: '
      '${record.message}',
    );

    if (record.error != null) {
      stderr.writeln('Exception Detail: ${record.error}');
    }
  });

  final httpClient = http.Client();
  final apiClient = AsteroidApiClient(httpClient);

  final cli = CliRunner(apiClient);

  try {
    await cli.run(arguments);
  } finally {
    httpClient.close();
    print('System network socket disconnected successfully.');
  }
}
