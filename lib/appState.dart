import 'package:flutter/material.dart';

class AppState extends ChangeNotifier{

  bool isDarkMode = false;

  void updateTheme(bool isDarkModeOn){
    this.isDarkMode = isDarkMode;
    notifyListeners(); 

  }

  void toggleDarkMode(){
    this.isDarkMode = !isDarkMode;
    notifyListeners();
  }

}