import 'dart:io';

import 'package:file_chooser/file_chooser.dart';

import '../flutter_properties.dart';

abstract class OperationSystem {
  final String currentPath = Platform.resolvedExecutable.toString().split(RegExp(r'([^/]+.app){1,}'))[0];
  final String systemPathSeparator = Platform.pathSeparator;
  final FlutterProperties flutterProperties = FlutterProperties();
  String name;
  bool startInstallation = false;
  bool endInstallation;
  bool downloadedFlutter = false;
  bool updatedFlutter = false;
  bool settingEnvironmentFlutter = false;
  bool installFinish = false;
  bool attempt = false;
  //int countError = 0;
  String installationSelectedPath = "Escolha o diretório.";
  String logTextDownloadFlutter = "Baixando o Flutter...";
  bool startDiagnostic = false;
  bool endDiagnostic = false;

  Future<ProcessResult> checkFlutterInstallation();
  Future<void> setSelectedPathForInstallation(FileChooserResult fileChooserResult);
  Future<Process> downloadFlutter();
  Future<ProcessResult> updateFlutter();
  Future<ProcessResult> setEnvironmentVariable();
  Future<ProcessResult> switchChannel(String channel);
  Future<ProcessResult> listChannel();

  Future<Process> flutterDoctor(bool diagnostic, {bool verbose = false, bool stdoutRun = false});
}
