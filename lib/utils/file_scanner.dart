import 'dart:io';

class FileScanner {
  List<File> getDartFiles(String rootPath) {
    final dir = Directory(rootPath);

    return dir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))
        .toList();
  }
}