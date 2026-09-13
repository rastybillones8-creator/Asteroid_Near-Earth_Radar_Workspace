import 'package:terminal_colors/terminal_colors.dart';
import 'package:test/test.dart';

void main() {
  test('color applies the selected ANSI code and resets it', () {
    expect(
      'Hello'.color(TerminalColor.cyan),
      '${TerminalColor.cyan.code}Hello${TerminalColor.reset.code}',
    );
  });

  test('styleHeader works correctly', () {
    expect(
      'Header'.styleHeader,
      '${TerminalColor.bold.code}'
      '${TerminalColor.cyan.code}'
      'Header'
      '${TerminalColor.reset.code}',
    );
  });

  test('styleSuccess works correctly', () {
    expect(
      'Success'.styleSuccess,
      '${TerminalColor.emerald.code}'
      'Success'
      '${TerminalColor.reset.code}',
    );
  });

  test('styleWarning works correctly', () {
    expect(
      'Warning'.styleWarning,
      '${TerminalColor.amber.code}'
      'Warning'
      '${TerminalColor.reset.code}',
    );
  });

  test('styleError works correctly', () {
    expect(
      'Error'.styleError,
      '${TerminalColor.crimson.code}'
      'Error'
      '${TerminalColor.reset.code}',
    );
  });
}
