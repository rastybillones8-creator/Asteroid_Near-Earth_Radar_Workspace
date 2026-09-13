import 'package:asteroid_api/asteroid_api.dart';

abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(this.name, this.description);

  Future<void> execute(AsteroidApiClient client, List<String> arguments);
}
