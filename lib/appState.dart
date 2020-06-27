import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isDarkMode = false;
  bool isAutoModeForBrightness = true;
  Function toggleSidebar;

  bool sideBarIsCollapsed = true;

  void setDarkMode(bool isDarkModeOn) {
    this.isDarkMode = isDarkModeOn;
    notifyListeners();
  }

  void setBrightnessAutoMode(bool isAutoMode) {
    this.isAutoModeForBrightness = isAutoMode;
    notifyListeners();
  }

  void toggleDarkMode() {
    this.isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void setSideBarCollapseMode(bool value) {
    sideBarIsCollapsed = value;
    notifyListeners();
  }

  void toggleSideBarCollapseMode() {
    sideBarIsCollapsed = !sideBarIsCollapsed;
    notifyListeners();
  }
}
