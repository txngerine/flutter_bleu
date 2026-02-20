import 'dart:convert';
import '../models/bleu_issue.dart';

class JsonReporter {
  void printReport(List<BleuIssue> issues) {
    final jsonList = issues.map((e) => e.toJson()).toList();
    print(jsonEncode(jsonList));
  }
}