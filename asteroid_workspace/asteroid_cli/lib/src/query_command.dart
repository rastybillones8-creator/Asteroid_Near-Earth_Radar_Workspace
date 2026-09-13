import 'package:asteroid_api/asteroid_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class QueryCommand extends CliCommand {
  QueryCommand()
      : super(
          'query',
          'Fetches asteroid records from NASA NeoWs.',
        );

  @override
  Future<void> execute(
    AsteroidApiClient client,
    List<String> arguments,
  ) async {
    if (arguments.isEmpty) {
      print(
        'Execution Error: Asteroid ID is missing.'.styleError,
      );
      return;
    }

    try {
      final result =
          await client.fetchMetadata(arguments.first);

      final hazardStatus = result.isPotentiallyHazardous
          ? 'YES'
          : 'NO';

      final buffer = StringBuffer()
        ..writeln(
          '--- NASA ASTEROID RADAR ---'.styleHeader,
        )
        ..writeln(
          'Identifier:  ${result.id}'.styleSuccess,
        )
        ..writeln(
          'Name:        ${result.name}',
        )
        ..writeln(
          'Magnitude:   ${result.primaryValue}',
        )
        ..writeln(
          'Velocity:    ${result.velocityKph.toStringAsFixed(2)} km/h',
        )
        ..writeln(
          'Hazardous:   $hazardStatus',
        )
        ..writeln(
          '---------------------------'.styleHeader,
        );

      if (result.isPotentiallyHazardous ||
          result.velocityKph >= 50000) {
        buffer.writeln(
          'WARNING: HIGH-VELOCITY / HAZARD DETECTED!'
              .styleWarning,
        );
      } else {
        buffer.writeln(
          'Status: No high-velocity hazard detected.'
              .styleSuccess,
        );
      }

      print(buffer);
    } on AsteroidException catch (e) {
      print(
        'Operation Failed: ${e.message}'.styleError,
      );
    }
  }
}