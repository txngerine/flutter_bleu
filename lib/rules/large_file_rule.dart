import '../models/bleu_issue.dart';
import '../models/bleu_severity.dart';
import 'rule.dart';

class LargeFileRule extends Rule {
  @override
  String get name => 'LargeFileRule';

  @override
  Future<List<BleuIssue>> check(String filePath, String content) async {
    final lines = content.split('\n');

    if (lines.length > 600) {
      return [
        BleuIssue(
          file: filePath,
          message:
              'File exceeds 600 lines (${lines.length}). Consider refactoring.',
          severity: BleuSeverity.warning,
          source: name,
        )
      ];
    }

    return [];
  }
}