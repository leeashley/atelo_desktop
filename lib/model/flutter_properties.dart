class FlutterProperties {
  bool _flutterExist = false;
  String _flutterVersion = "";
  String _dartVersion = "";
  String _flutterChannel = "";
  List<String> _channels = [];

  set flutterExist(bool value) {
    _flutterExist = value;
  }

  set flutterVersion(String value) {
    _flutterVersion = value;
  }

  set dartVersion(String value) {
    _dartVersion = value;
  }

  set flutterChannel(String value) {
    _flutterChannel = value;
  }

  set channels(List<String> value) {
    _channels = value;
  }

  bool get flutterExist => _flutterExist;

  String get flutterVersion => _flutterVersion;

  String get dartVersion => _dartVersion;

  String get flutterChannel => _flutterChannel;

  List<String> get channels => _channels;
}
