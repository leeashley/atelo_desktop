import 'dart:convert';

import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:http/http.dart';
import 'package:version/version.dart';

class AteloVersion {
  // ATRIBUTES
  final Version currentVersion = Version(0, 1, 2);
  String urlForNewVersion = "";
  final OperationSystemController operationSystemController;
  String applicationExtension;

  AteloVersion(this.operationSystemController);

  // METHODS

  // disabled
  // Future<String> updateAtelo() async {
  //   try {
  //     await checkUpdate();
  //     await downloadAndReplacement(operationSystemController.operationSystem);
  //     return "success";
  //   } catch (error) {
  //     return error.toString();
  //   }
  // }

  Future<String> checkUpdate(context) async {
    String operationSystemName = operationSystemController.operationSystem.name;
    try {
      Response response = await get('https://atelo.unicobit.com/$operationSystemName\_version.json');
      if (response.statusCode != 200) {
        return "${AteloLocalizations.of(context).ateloVersionError}";
      }
      Map<String, dynamic> ateloVersion = jsonDecode(response.body);
      this.urlForNewVersion = ateloVersion['URL'];
      final Version lastVersion = Version.parse(ateloVersion['version']);
      if (currentVersion < lastVersion) {
        return "${AteloLocalizations.of(context).newVersionAtelo}";
      } else {
        return "${AteloLocalizations.of(context).noNewVersionAtelo}";
      }
    } catch (error) {
      throw error.toString();
    }
  }

  // disabled
  // String settingPatternForGetNameFile(OperationSystem operationSystem) {
  //   String pattern;
  //   if (operationSystem.name == "macos") {
  //     pattern = r'([^/]+.app){1,}';
  //     return pattern;
  //   } else if (operationSystem.name == "linux") {
  //     pattern = r'([^/]+.app){1,}';
  //     return pattern;
  //   } else if (operationSystem.name == "windows") {
  //     pattern = r'([^/]+.app){1,}';
  //     return pattern;
  //   } else {
  //     throw "Não foi possível identificar o sistema operacional";
  //   }
  // }

  // disabled
  // String identifyingApplicationExtension(OperationSystem operationSystem) {
  //   if (operationSystem.name == "macos") {
  //     return ".app";
  //   } else if (operationSystem.name == "linux") {
  //     return ".app";
  //   } else if (operationSystem.name == "windows") {
  //     return ".exe";
  //   } else {
  //     throw "Não foi possível identificar o sistema operacional";
  //   }
  // }

  // disabled
  // Future<String> downloadAndReplacement(OperationSystem operationSystem) async {
  //   String pattern = settingPatternForGetNameFile(operationSystem);
  //   String applicationExtension = identifyingApplicationExtension(operationSystem);
  //   RegExp regExp = RegExp(pattern);
  //   final String ateloFile = regExp.stringMatch(Platform.resolvedExecutable.toString());
  //   print(ateloFile);
  //   final String separator = Platform.pathSeparator;
  //   final String ateloZip = "novo_atelo.zip";
  //   try {
  //     await Process.run('curl', ['-o', "${operationSystem.currentPath}$separator$ateloZip", '$urlForNewVersion'],
  //         runInShell: true);
  //     if (operationSystem.name == "windows") {
  //       Process.runSync(
  //           'tar', ['-xvf', '${operationSystem.currentPath}$separator$ateloZip', '-C', '${operationSystem.currentPath}'],
  //           runInShell: false);
  //       Process.runSync('del', ['/f', '${operationSystem.currentPath}$separator$ateloZip'], runInShell: true);
  //       Process.runSync('rename', ['${operationSystem.currentPath}${separator}atelo_win.exe', '$ateloFile'], runInShell: true);
  //     } else {
  //       Process.runSync(
  //           'unzip', ['-o', '${operationSystem.currentPath}$separator$ateloZip', '-d', '${operationSystem.currentPath}'],
  //           runInShell: false);
  //       Process.runSync('rm', ['-f', '${operationSystem.currentPath}$ateloZip'], runInShell: false);
  //       String command =
  //           "rm -Rf ${operationSystem.currentPath}$ateloFile && mv ${operationSystem.currentPath}atelo_${operationSystem.name}$applicationExtension ${operationSystem.currentPath}$ateloFile";
  //       Future.delayed(Duration(milliseconds: 500)).then((value) async => {
  //             await Process.run(
  //                 'bash',
  //                 [
  //                   '-c',
  //                   '$command',
  //                 ],
  //                 runInShell: true),
  //           });
  //       return "success";
  //     }
  //   } catch (error) {
  //     return error.toString();
  //   }
  // }
}
