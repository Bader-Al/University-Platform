import 'package:flutter/material.dart';

class AppState extends ChangeNotifier{

  bool isDarkMode = false;

  void setDarkMode(bool isDarkModeOn){
    this.isDarkMode = isDarkModeOn;
    notifyListeners(); 

  }

  void toggleDarkMode(){
    this.isDarkMode = !isDarkMode;
    notifyListeners();
  }

}