import '../models/bleu_issue.dart';
import '../models/bleu_severity.dart';

class MachineParser {
  List<BleuIssue> parse(String output) {
    final lines = output.split('\n');
    final issues = <BleuIssue>[];

    for (final line in lines) {
      if (!line.contains('|')) continue;

      final parts = line.split('|');

      // Machine format:
      // SEVERITY|TYPE|ERROR_CODE|FILE|LINE|COLUMN|LENGTH|MESSAGE

      if (parts.length < 8) continue;

      final severity = _mapSeverity(parts[0]);

      issues.add(
        BleuIssue(
          file: parts[3],
          line: int.tryParse(parts[4]),
          message: parts[7], // ✅ correct index
          severity: severity,
          source: 'dart_analyzer',
        ),
      );
    }

    return issues;
  }

  BleuSeverity _mapSeverity(String raw) {
    switch (raw.toUpperCase()) {
      case 'ERROR':
        return BleuSeverity.error;
      case 'WARNING':
        return BleuSeverity.warning;
      default:
        return BleuSeverity.info;
    }
  }
}