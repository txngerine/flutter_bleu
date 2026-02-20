import '../models/bleu_issue.dart';
import '../models/bleu_severity.dart';

class ConsoleReporter {
  void printReport(List<BleuIssue> issues) {
    print('\n🧊 flutter bleu\n');

    if (issues.isEmpty) {
      print('✅ No issues found.\n');
      return;
    }

    for (final issue in issues) {
      final icon = _icon(issue.severity);

      print(
          '$icon ${issue.file}${issue.line != null ? ':${issue.line}' : ''}');
      print('   ${issue.source} → ${issue.message}\n');
    }

    print('Total Issues: ${issues.length}\n');
  }

  String _icon(BleuSeverity severity) {
    switch (severity) {
      case BleuSeverity.error:
        return '❌';
      case BleuSeverity.warning:
        return '⚠';
      case BleuSeverity.info:
        return 'ℹ';
    }
  }
}