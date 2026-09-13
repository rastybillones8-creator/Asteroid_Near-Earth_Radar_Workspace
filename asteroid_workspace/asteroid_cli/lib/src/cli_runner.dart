import 'package:asteroid_api/asteroid_api.dart';

import 'command_base.dart';
import 'help_command.dart';
import 'query_command.dart';

class CliRunner {
  final AsteroidApiClient client;

  late final List<CliCommand> commands;

  CliRunner(this.client) {
    commands = [QueryCommand()];

    commands.add(HelpCommand(commands));
  }

  Future<void> run(List<String> arguments) async {
    if (arguments.isEmpty) {
      await commands.last.execute(client, const []);
      return;
    }

    final command = commands.where((item) => item.name == arguments.first);

    if (command.isEmpty) {
      print('Unknown command: ${arguments.first}');
      return;
    }

    await command.first.execute(client, arguments.skip(1).toList());
  }
}
