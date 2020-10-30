import 'package:flutter/material.dart';

class ScreenListController extends ChangeNotifier {
  String currentScreen = "Visão Geral";

  setCurrentScreen(String screen) {
    currentScreen = screen;
    notifyListeners();
  }
}
