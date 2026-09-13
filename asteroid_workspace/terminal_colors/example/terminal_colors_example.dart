import 'package:terminal_colors/terminal_colors.dart';

void main() {
  print('Asteroid Near-Earth Radar'.styleHeader);
  print('System ready'.styleSuccess);
  print('Potential warning'.styleWarning);
  print('Connection error'.styleError);

  print('Custom cyan text'.color(TerminalColor.cyan));
}
