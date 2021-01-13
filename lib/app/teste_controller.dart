import 'package:flutter/material.dart';

class TesteController extends ChangeNotifier {
  static TesteController instance = TesteController();
  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
