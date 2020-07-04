import 'package:flutter/material.dart';
import './pages/StudentHome/studentHomeHandler.dart';

class AppState extends ChangeNotifier {
  bool isDarkMode = false;
  bool isAutoModeForBrightness = true;
  Function toggleSidebar;
  Widget selectedSidebarPage = StudentHome();

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

  void setSelectedSidebarPage(Widget page) {
    selectedSidebarPage = page;
    notifyListeners();
  }

  Widget getSelectedSidebarPage() {
    return selectedSidebarPage;
  }
}
