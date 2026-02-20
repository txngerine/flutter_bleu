import '../models/bleu_issue.dart';

abstract class Rule {
  String get name;
  Future<List<BleuIssue>> check(String filePath, String content);
}