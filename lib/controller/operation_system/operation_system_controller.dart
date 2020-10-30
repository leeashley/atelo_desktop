import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:atelo_desktop/exceptions/exceptions.dart';
import 'package:atelo_desktop/factory/system_operation/system_operation.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/model/operation_system/operation_system.dart';
import 'package:atelo_desktop/view/atoms/expection_window/exception_window.dart';
import 'package:file_chooser/file_chooser.dart';
import 'package:flutter/material.dart';

class OperationSystemController extends ChangeNotifier {
  OperationSystem operationSystem = SystemOperationFactory().identifySystemOperation();
  StreamController<String> diagnosticStream = StreamController.broadcast();
  StreamController<String> downloadStream = StreamController.broadcast();
  bool isLoading = true;
  bool errorInstallation = false;
  String errorMessageInstallation = "";
  Exceptions exceptions = Exceptions();

  loadFlutterProperties(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then((value) => {
          isLoading = true,
          notifyListeners(),
        });
    ExceptionWindowCustom exceptionWindowCustom = ExceptionWindowCustom(context);
    String separator;
    String exceptionResult;
    operationSystem.name == "windows" ? separator = "â€¢" : separator = "•";
    operationSystem.checkFlutterInstallation().then((processResult) => {
          exceptionResult = exceptions.operationSystemExceptions(processResult, processResult.exitCode, context),
          if (exceptionResult == "success")
            {
              operationSystem.flutterProperties.flutterVersion = processResult.stdout.toString().split(separator)[0].split("Flutter")[1],
              operationSystem.flutterProperties.dartVersion =
                  processResult.stdout.toString().split(separator)[6].split("Dart")[1].split("(")[0],
              operationSystem.flutterProperties.flutterChannel =
                  processResult.stdout.toString().split(separator)[1].split("channel")[1].toUpperCase(),
              operationSystem.flutterProperties.flutterExist = true,
              Future.delayed(Duration(milliseconds: 200)).then((value) => {
                    isLoading = false,
                    notifyListeners(),
                  }),
            }
          else
            {
              Future.delayed(Duration(milliseconds: 200)).then((value) => {
                    operationSystem.flutterProperties.flutterVersion = "${AteloLocalizations.of(context).flutterNotInstalled}",
                    operationSystem.flutterProperties.flutterExist = false,
                    isLoading = false,
                    exceptionWindowCustom.showMyDialog(
                      title: "${AteloLocalizations.of(context).errorLoadingFlutter}",
                      messageError: exceptionResult,
                      closeButtonFunction: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    notifyListeners(),
                  }),
            }
        });
  }

  setSelectedPathForInstallation(FileChooserResult fileChooserResult, BuildContext context) {
    operationSystem
        .setSelectedPathForInstallation(fileChooserResult)
        .then((value) => {
              notifyListeners(),
            })
        .catchError(((err) => {print("${AteloLocalizations.of(context).errorSelectingFolder}")}));
  }

  Future<void> startInstallationFlutter(BuildContext context) async {
    operationSystem.startInstallation = true;
    errorInstallation = false;
    errorMessageInstallation = "";
    notifyListeners();
    ExceptionWindowCustom exceptionWindowCustom = ExceptionWindowCustom(context);
    downloadFlutter(exceptionWindowCustom, context)
        .then((value) => {
              operationSystem.downloadedFlutter = true,
              notifyListeners(),
            })
        .catchError((err) {
      print(err);
    });
  }

  downloadFlutter(ExceptionWindowCustom exceptionWindowCustom, BuildContext context) async {
    RegExp regExp = RegExp(r'[^:]*$');
    Process process = await operationSystem.downloadFlutter();
    return process.stderr.transform(utf8.decoder).listen((event) async {
      print(event.toString().replaceAll('\n', ' '));
      if (event.contains("Receiving objects")) {
        String downloadLog = regExp.stringMatch(event).trim();
        downloadStream.add(downloadLog);
      } else if (event.contains("already exists and is not an empty directory.") || event.contains("fatal:")) {
        process.kill();
        downloadStream.close();
        int exitCode = await process.exitCode;
        errorMessageInstallation = exceptions.operationSystemExceptions(event, exitCode, context);
        errorInstallation = true;
        operationSystem.startInstallation = false;
        exceptionWindowCustom.showMyDialog(
          title: "${AteloLocalizations.of(context).errorInstallingFlutter}",
          messageError: errorMessageInstallation,
          closeButtonFunction: () {
            Navigator.of(exceptionWindowCustom.context).pop();
          },
        );
        notifyListeners();
      }
    }, onDone: (() async {
      downloadStream.close();
      int exitCode = await process.exitCode;
      if (exitCode == 128 || exitCode == -1) {
        errorInstallation = true;
        operationSystem.startInstallation = false;
        errorMessageInstallation = exceptions.operationSystemExceptions(process, exitCode, context);
        exceptionWindowCustom.showMyDialog(
          title: "${AteloLocalizations.of(context).errorInstallingFlutter}",
          messageError: process.stderr.toString(),
          closeButtonFunction: () {
            Navigator.of(exceptionWindowCustom.context).pop();
          },
        );
      }
    })).asFuture();
  }

  Future<String> updateFlutter(BuildContext context) async {
    ProcessResult processResult;
    processResult = await operationSystem.updateFlutter();
    errorMessageInstallation = exceptions.operationSystemExceptions(processResult, exitCode, context);
    return errorMessageInstallation;
  }

  Future<void> setEnvironment(BuildContext context) async {
    ExceptionWindowCustom exceptionWindowCustom = ExceptionWindowCustom(context);
    ProcessResult processResult = await operationSystem.setEnvironmentVariable();
    errorMessageInstallation = exceptions.operationSystemExceptions(processResult, exitCode, context);
    if (errorMessageInstallation != "success") {
      operationSystem.startInstallation = false;
      Timer(Duration(seconds: 2), () {
        exceptionWindowCustom.showMyDialog(
          title: "${AteloLocalizations.of(context).errorInstallingFlutter}",
          messageError: errorMessageInstallation,
          closeButtonFunction: () {
            Navigator.of(context).pop();
          },
        );
        notifyListeners();
      });
    } else {
      Timer(Duration(seconds: 2), () {
        operationSystem.settingEnvironmentFlutter = true;
        notifyListeners();
      });
    }
  }

  Future<void> diagnosticFlutter() async {
    operationSystem.startDiagnostic = true;
    diagnosticStream.add("startDiagnostic");
    notifyListeners();
    try {
      String resultFinal = "";
      Future<Process> runFlutterDoctor = operationSystem.flutterDoctor(true);
      runFlutterDoctor.then((Process process) => {
            process.stdout.transform(utf8.decoder).listen((output) {
              print("PROCESSO: " + output.toString());
              diagnosticStream.add(output);
              resultFinal = resultFinal + output;
            }).onDone(() {
              operationSystem.endDiagnostic = true;
              operationSystem.startDiagnostic = false;
              diagnosticStream.add(resultFinal);
              diagnosticStream.done;
              notifyListeners();
            }),
          });
    } catch (err) {
      operationSystem.endDiagnostic = true;
      operationSystem.startDiagnostic = false;
      notifyListeners();
    }
  }

  Future<String> switchChannel(String channel, BuildContext context) async {
    ExceptionWindowCustom exceptionWindowCustom = ExceptionWindowCustom(context);
    Future.delayed(Duration(milliseconds: 100)).then((value) => {
          isLoading = true,
          notifyListeners(),
        });
    ProcessResult processResult = await operationSystem.switchChannel(channel.toLowerCase());
    String exceptionResult = exceptions.operationSystemExceptions(processResult, processResult.exitCode, context);
    if (exceptionResult == "success") {
      return "success";
    } else {
      Future.delayed(Duration(milliseconds: 200)).then((value) => {
            isLoading = false,
            exceptionWindowCustom.showMyDialog(
              title: "${AteloLocalizations.of(context).unableChangeFlutterChannel}",
              messageError: exceptionResult,
              closeButtonFunction: () {
                Navigator.of(context).pop();
              },
            ),
            notifyListeners(),
          });
      return "falied";
    }
  }

  Future<List<String>> listChannels(BuildContext context) async {
    Future.delayed(Duration(milliseconds: 100)).then((value) => {
          isLoading = true,
          notifyListeners(),
        });
    ExceptionWindowCustom exceptionWindowCustom = ExceptionWindowCustom(context);
    ProcessResult processResult = await operationSystem.listChannel();
    String exceptionResult = exceptions.operationSystemExceptions(processResult, processResult.exitCode, context);
    if (exceptionResult == "success") {
      List<String> listChannels = processResult.stdout.toString().split('\n');
      listChannels.removeWhere((element) => element.contains(":") || element.isEmpty);
      listChannels.removeWhere((element) => element.contains("Downloading") || element.isEmpty);
      await Future.delayed(Duration(milliseconds: 200)).then((value) => {
            isLoading = false,
            notifyListeners(),
          });
      return listChannels;
    } else {
      Future.delayed(Duration(milliseconds: 200)).then((value) => {
            isLoading = false,
            exceptionWindowCustom.showMyDialog(
              title: "${AteloLocalizations.of(context).unableChangeFlutterChannel}",
              messageError: exceptionResult,
              closeButtonFunction: () {
                Navigator.of(context).pop();
              },
            ),
            notifyListeners(),
          });
    }
  }
}
