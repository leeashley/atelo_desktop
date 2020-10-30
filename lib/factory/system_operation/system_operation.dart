import 'dart:io';

import 'package:atelo_desktop/model/flutter_properties.dart';
import 'package:atelo_desktop/model/operation_system/linux.dart';
import 'package:atelo_desktop/model/operation_system/mac_os.dart';
import 'package:atelo_desktop/model/operation_system/operation_system.dart';
import 'package:atelo_desktop/model/operation_system/windows_system.dart';

class SystemOperationFactory {
  OperationSystem identifySystemOperation() {
    FlutterProperties flutterProperties;
    if (Platform.isMacOS) {
      MacSystem macOs = MacSystem();
      return macOs;
    } else if (Platform.isWindows) {
      WindowsSystem windows = WindowsSystem();
      return windows;
    } else if (Platform.isLinux) {
      LinuxSystem linux = LinuxSystem();
      return linux;
    } else {
      //Console.setTextColor(1);
      throw ("Não foi possível detectador o sistema operacional.");
    }
  }
}
