import 'package:atelo_desktop/factory/screens/screens.dart';
import 'package:atelo_desktop/view/screens/overview.dart';
import 'package:flutter/material.dart';

class ScreenController extends ChangeNotifier {
  Widget screen = Overview();

  goToScreen(String optionSelected) {
    Screens newScreen = Screens(
      sideBarOptions: optionSelected,
    );
    screen = newScreen;
    notifyListeners();
  }
}
