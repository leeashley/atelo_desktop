import 'dart:io';

import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:flutter/cupertino.dart';

class Exceptions {
  String operationSystemExceptions(dynamic result, int exitCode, BuildContext context) {
    if (result.runtimeType == String) {
      return _exceptionsForString(result, exitCode, context);
    } else {
      return _exceptionsForProcessResult(result, exitCode, context);
    }
  }
}

String _exceptionsForString(String result, int exitCode, BuildContext context) {
  if (result != null && exitCode != 0) {
    if (result.contains("'flutter' is not recognized as an internal or external command") ||
        result.contains("'flutter' is not recognized as the name of a cmdlet")) {
      return "${AteloLocalizations.of(context).flutterCommandNotFound}";
    } else if (result.contains("index-pack failed")) {
      return "${AteloLocalizations.of(context).errorDownloadingFlutter}";
    } else if (result.contains("already exists and is not an empty directory")) {
      return "${AteloLocalizations.of(context).errorFlutterExistsInDirectory}";
    } else if (result.contains("The 'flutter' tool you are currently running is from a different Flutter repository")) {
      return "${AteloLocalizations.of(context).errorTwoVersionsFlutter}";
    }
  } else if (result.isNotEmpty) {
    return result;
  } else {
    return result;
  }
}

String _exceptionsForProcessResult(ProcessResult result, int exitCode, BuildContext context) {
  if (result.stderr != null && result.exitCode != 0) {
    if (result.stderr.toString().contains("'flutter' is not recognized as an internal or external command") ||
        result.stderr.toString().contains("'flutter' is not recognized as the name of a cmdlet") ||
        result.stderr.toString().contains("flutter: command not found")) {
      return "${AteloLocalizations.of(context).flutterCommandNotFound}";
    } else if (result.stderr.toString().contains("index-pack failed")) {
      return "${AteloLocalizations.of(context).errorDownloadingFlutter}";
    } else if (result.stderr.toString().contains("already exists and is not an empty directory")) {
      return "${AteloLocalizations.of(context).errorFlutterExistsInDirectory}";
    } else if (result.stderr
        .toString()
        .contains("The 'flutter' tool you are currently running is from a different Flutter repository")) {
      return "${AteloLocalizations.of(context).errorTwoVersionsFlutter}";
    } else {
      return result.stderr.toString();
    }
  } else if (result.stderr.toString().isNotEmpty && result.exitCode != 0) {
    return result.stderr.toString();
  } else {
    return "success";
  }
}
