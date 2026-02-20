import 'dart:io';
import '../analyzer/dart_analyzer.dart';
import '../models/bleu_issue.dart';
import '../reporter/console_reporter.dart';
import '../reporter/json_reporter.dart';
import '../rules/large_file_rule.dart';
import '../utils/file_scanner.dart';

class Runner {
  Future<void> run(
    String path, {
    bool json = false,
    bool ci = false,
  }) async {
    print('🔍 Analyzing $path ...');

    final dartIssues = await DartAnalyzer().analyze(path);

    final files = FileScanner().getDartFiles(path);

    final rule = LargeFileRule();
    final ruleIssues = <BleuIssue>[];

    for (final file in files) {
      final content = await file.readAsString();
      final issues = await rule.check(file.path, content);
      ruleIssues.addAll(issues);
    }

    final allIssues = [...dartIssues, ...ruleIssues];

    if (json) {
      JsonReporter().printReport(allIssues);
    } else {
      ConsoleReporter().printReport(allIssues);
    }

    if (ci && allIssues.any((e) => e.severity.name == 'error')) {
      exit(1);
    }
  }
}