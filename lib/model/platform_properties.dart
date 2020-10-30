import 'dart:io';

class PlatformProperties {
  final String name = Platform.operatingSystem;
  final String version = Platform.operatingSystemVersion;
  final String hostName = Platform.localHostname;
  String _locale;
  String _versionName;

  String get locale => _locale;

  set locale(String value) {
    _locale = value;
  }

  set versionName(String value) {
    _versionName = value;
  }
}
