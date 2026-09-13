import 'package:asteroid_api/asteroid_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class HelpCommand extends CliCommand {
  final List<CliCommand> commands;

  HelpCommand(this.commands)
      : super(
          'help',
          'Displays available Asteroid Near-Earth Radar commands.',
        );

  @override
  Future<void> execute(
    AsteroidApiClient client,
    List<String> arguments,
  ) async {
    final buffer = StringBuffer()
      ..writeln('ASTEROID NEAR-EARTH RADAR'.styleHeader)
      ..writeln()
      ..writeln('Available Commands:'.styleSuccess);

    for (final command in commands) {
      buffer.writeln(
        '  ${command.name.padRight(10)} ${command.description}',
      );
    }

    print(buffer.toString());
  }
}