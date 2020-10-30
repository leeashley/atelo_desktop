import 'dart:io';

import 'package:file_chooser/file_chooser.dart';

import 'operation_system.dart';

class WindowsSystem extends OperationSystem {
  final String name = "windows";

  @override
  Future<ProcessResult> setEnvironmentVariable() {
    return Process.run('setx', ['Path', '%Path%;$installationSelectedPath\\flutter\\bin'], runInShell: false);
  }

  @override
  Future<ProcessResult> checkFlutterInstallation() {
    String command = "flutter --version";
    return Process.run('powershell.exe', [
      '\$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")',
      ';',
      command
    ]);
  }

  @override
  Future<Process> downloadFlutter() {
    return Process.start(
        'git', ['clone', 'https://github.com/flutter/flutter.git', '-b', 'stable', '$installationSelectedPath\\flutter', '--progress'],
        runInShell: true);
  }

  @override
  Future<Process> flutterDoctor(bool diagnostic, {bool verbose = false, bool stdoutRun = false}) {
    String command = "flutter doctor";
    return Process.start(
      'powershell.exe',
      [
        '\$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")',
        ';',
        command
      ],
      runInShell: false,
    );
  }

  @override
  Future<void> setSelectedPathForInstallation(FileChooserResult fileChooserResult) async {
    if (fileChooserResult.paths.isNotEmpty) {
      List pathNotTreatment = fileChooserResult.paths[0].split(systemPathSeparator);
      String fileName = fileChooserResult.paths[0].split(systemPathSeparator).last;
      pathNotTreatment.remove(fileName);
      this.installationSelectedPath = pathNotTreatment.join(systemPathSeparator);
      print("Pasta escolhida: " + installationSelectedPath);
    } else {
      print("Usuário não escolheu nenhuma pasta.");
    }
  }

  @override
  Future<ProcessResult> updateFlutter() {
    String command = "flutter upgrade";
    return Process.run(
        'powershell.exe',
        [
          '\$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")',
          ';',
          command
        ],
        runInShell: false,
        includeParentEnvironment: true);
    // this.isCheckError(updateFlutter);
  }

  @override
  Future<ProcessResult> switchChannel(String channel) {
    String command = "flutter channel $channel; flutter upgrade";
    return Process.run(
        'powershell.exe',
        [
          '\$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")',
          ';',
          command
        ],
        runInShell: false,
        includeParentEnvironment: true);
  }

  @override
  Future<ProcessResult> listChannel() {
    String command = "flutter channel";
    return Process.run(
        'powershell.exe',
        [
          '\$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")',
          ';',
          command
        ],
        runInShell: false,
        includeParentEnvironment: true);
  }
}
