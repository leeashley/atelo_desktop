import 'dart:io';

import 'package:file_chooser/file_chooser.dart';

import 'operation_system.dart';

class LinuxSystem extends OperationSystem {
  final String name = "linux";
  final String shellFile = Platform.environment['SHELL'].split('/')[2];

  @override
  Future<ProcessResult> checkFlutterInstallation() {
    String envVariableFile = shellFile.contains("bash") ? ".bash_profile" : ".${shellFile}rc";
    String command = "source \$HOME/$envVariableFile && flutter --version";
    return Process.run('bash', ['-c', '$command']);
  }

  @override
  Future<void> setSelectedPathForInstallation(FileChooserResult fileChooserResult) async {
    if (fileChooserResult.paths.isNotEmpty) {
      List pathNotTreatment = fileChooserResult.paths[0].split("/");
      String fileName = fileChooserResult.paths[0].split("/").last;
      pathNotTreatment.remove(fileName);
      this.installationSelectedPath = pathNotTreatment.join("/");
      print("Pasta escolhida: " + installationSelectedPath);
    } else {
      print("Usuário não escolheu nenhuma pasta.");
    }
  }

  @override
  Future<Process> downloadFlutter() async {
    return Process.start(
        'git',
        [
          'clone',
          '--branch',
          'stable',
          'https://github.com/flutter/flutter.git',
          '$installationSelectedPath/flutter',
          '--progress'
        ],
        runInShell: true);
  }

  @override
  Future<ProcessResult> setEnvironmentVariable() {
    String envVariableFile = shellFile.contains("bash") ? ".bash_profile" : ".${shellFile}rc";
    String path =
        "'" + "\"" + "\$PATH:$installationSelectedPath${systemPathSeparator}flutter${systemPathSeparator}bin" + "\"" + "'";
    return Process.run(
        'bash',
        [
          '-c',
          'echo export PATH=$path'
              " >> \$HOME${systemPathSeparator}$envVariableFile"
        ],
        runInShell: true);
  }

  @override
  Future<Process> flutterDoctor(bool diagnostic, {bool verbose = false, bool stdoutRun = false}) {
    String envVariableFile = shellFile.contains("bash") ? ".bash_profile" : ".${shellFile}rc";
    String command = "source \$HOME/$envVariableFile && flutter doctor";
    return Process.start(
      'bash',
      ['-c', '$command'],
    );
  }

  @override
  Future<ProcessResult> updateFlutter() {
    String envVariableFile = shellFile.contains("bash") ? ".bash_profile" : ".${shellFile}rc";
    String command = "source \$HOME/$envVariableFile && flutter upgrade";
    return Process.run('bash', ['-c', '$command'], runInShell: true);
  }

  @override
  Future<ProcessResult> switchChannel(String channel) {
    String envVariableFile = shellFile.contains("bash") ? ".bash_profile" : ".${shellFile}rc";
    String command = "source \$HOME/$envVariableFile && flutter channel $channel && flutter upgrade";
    return Process.run('bash', ['-c', '$command'], runInShell: true);
  }

  @override
  Future<ProcessResult> listChannel() {
    String envVariableFile = shellFile.contains("bash") ? ".bash_profile" : ".${shellFile}rc";
    String command = "source \$HOME/$envVariableFile && flutter channel";
    return Process.run('bash', ['-c', '$command'], runInShell: true);
  }
}
