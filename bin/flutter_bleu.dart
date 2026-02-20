import 'package:args/args.dart';
import 'package:flutter_bleu/core/runner.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addCommand('analyze')
    ..addFlag('json', negatable: false)
    ..addFlag('ci', negatable: false);

  final results = parser.parse(arguments);

  if (results.command?.name == 'analyze') {
    final path = results.command!.arguments.isNotEmpty
        ? results.command!.arguments.first
        : '.';

    await Runner().run(
      path,
      json: results['json'],
      ci: results['ci'],
    );
  } else {
    print('Usage: flutter_bleu analyze <path> [--json] [--ci]');
  }
}