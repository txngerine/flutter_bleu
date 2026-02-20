import 'bleu_severity.dart';

class BleuIssue {
  final String file;
  final int? line;
  final String message;
  final BleuSeverity severity;
  final String source;

  BleuIssue({
    required this.file,
    required this.message,
    required this.severity,
    required this.source,
    this.line,
  });

  Map<String, dynamic> toJson() => {
        'file': file,
        'line': line,
        'message': message,
        'severity': severity.name,
        'source': source,
      };
}