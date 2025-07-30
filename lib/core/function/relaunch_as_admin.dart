import 'dart:io';

void relaunchAsAdmin() async {
  final script = '''
Start-Process "${Platform.resolvedExecutable}" `
  -ArgumentList "'${Platform.script.toFilePath()}'" `
  -Verb RunAs
''';

  await Process.run('powershell', ['-Command', script]);
  exit(0); // يقفل التطبيق الأصلي
}
