import 'dart:io';
import '../models/bleu_issue.dart';
import 'machine_parser.dart';

class DartAnalyzer {
  Future<List<BleuIssue>> analyze(String path) async {
    final result = await Process.run(
      'dart',
      ['analyze', path, '--format=machine'],
    );

    return MachineParser().parse(result.stdout);
  }
}