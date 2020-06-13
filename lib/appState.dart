import 'package:flutter/material.dart';

class AppState extends ChangeNotifier{

  bool isDarkMode = false;
  bool isAutoModeForBrightness = true;

  void setDarkMode(bool isDarkModeOn){
    this.isDarkMode = isDarkModeOn;
    notifyListeners(); 

  }
   void setBrightnessAutoMode(bool isAutoMode){
    this.isAutoModeForBrightness = isAutoMode;
    notifyListeners(); 

  }

  void toggleDarkMode(){
    this.isDarkMode = !isDarkMode;
    notifyListeners();
  }

}