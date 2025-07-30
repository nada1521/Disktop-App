import 'dart:io';

Future<bool> isRunningAsAdmin() async {
  final result = await Process.run('net', ['session']);
  return result.exitCode == 0;
}
