import 'dart:io';

import 'package:asteroid_api/asteroid_api.dart';
import 'package:asteroid_cli/asteroid_cli.dart';
import 'package:asteroid_cli/src/logging_config.dart';
import 'package:http/http.dart' as http;
import 'package:terminal_colors/terminal_colors.dart';

Future<void> main() async {
  configureSystemTelemetry();

  final httpClient = http.Client();
  final apiClient = AsteroidApiClient(httpClient);

  final queryCmd = QueryCommand();

  final commandsList = <CliCommand>[queryCmd];

  print('Welcome to the Asteroid Near-Earth Radar CLI Tool!'.styleHeader);

  try {
    while (true) {
      stdout.write('\nasteroid > ');

      final input = stdin.readLineSync();

      if (input == null || input.trim().toLowerCase() == 'exit') {
        print('Exiting platform...'.styleWarning);
        break;
      }

      final trimmed = input.trim();

      if (trimmed.isEmpty) {
        continue;
      }

      final parts = trimmed.split(RegExp(r'\s+'));
      final commandName = parts.first.toLowerCase();
      final args = parts.sublist(1);

      final matchingCommands = commandsList.where(
        (command) => command.name == commandName,
      );

      if (matchingCommands.isNotEmpty) {
        await matchingCommands.first.execute(apiClient, args);
      } else if (commandName == 'help') {
        print('Available Commands:'.styleHeader);

        for (final command in commandsList) {
          print(
            '  ${command.name.padRight(10)} '
            '${command.description}',
          );
        }

        print('  exit       Exit the application');
      } else {
        print(
          'Unknown command. Type "help" for available commands.'.styleError,
        );
      }
    }
  } finally {
    httpClient.close();

    print('System network socket disconnected successfully.'.styleSuccess);
  }
}
