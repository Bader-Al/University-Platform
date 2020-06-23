import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightSurfaceColor = Colors.white;
  static const Color _lightSurfaceVariantColor = Color(0xffF9F9F9);

  static const Color _lightPrimaryColor = Color(0xff5E7CE2);
  static const Color _lightPrimaryVariantColor = Color(0xff91A6FF);
  static const Color _lightSecondaryColor = Color(0xff63F5EF);
  static const Color _lightSecondaryVariantColor = Color(0xffa9f9f4);
  static const Color _lightOnSurfaceColor = Color(0xff333333);

  static final ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(
      color: _lightSurfaceColor
    ),
      scaffoldBackgroundColor:
          _lightSurfaceColor, // might need to be main color due to sidebar
      colorScheme: ColorScheme(
          primary: _lightPrimaryColor,
          primaryVariant: _lightPrimaryVariantColor,
          secondary: _lightSecondaryColor,
          secondaryVariant: _lightSecondaryVariantColor,
          surface: _lightSurfaceVariantColor,
          background: _lightSurfaceColor,
          error: Colors.red, //TODO:: change
          onPrimary: _lightSurfaceColor,
          onSecondary: _lightOnSurfaceColor,
          onSurface: _lightOnSurfaceColor,
          onBackground: _lightOnSurfaceColor,
          onError: _lightSurfaceColor,
          brightness: Brightness.light
          ));

  static final ThemeData darkTheme = ThemeData(
    cardColor: _darkSurfaceColor,
    iconTheme: IconThemeData(
      color: _darkSurfaceColor
    ),
      scaffoldBackgroundColor:
          _darkSurfaceColor, // might need to be main color due to sidebar
      colorScheme: ColorScheme(
          primary: _darkPrimaryColor,
          primaryVariant: _darkPrimaryVariantColor,
          secondary: _darkSecondaryColor,
          secondaryVariant: _darkSecondaryVariantColor,
          surface: _darkSurfaceVariantColor,
          background: _darkSurfaceColor,
          error: Colors.red, //TODO:: change
          onPrimary: _darkSurfaceVariantColor,
          onSecondary: _darkOnSurfaceColor,
          onSurface: _darkOnSurfaceColor,
          onBackground: _darkOnSurfaceColor,
          onError: _darkSurfaceColor,
          brightness: Brightness.dark,

          
          ));

  static const Color _darkSurfaceColor = Color(0xff303030);
  static const Color _darkSurfaceVariantColor = Color(0xff212121);

  static const Color _darkPrimaryColor = Color(0xff5E7CE2);
  static const Color _darkPrimaryVariantColor = Color(0xff869DE9);
  static const Color _darkSecondaryColor = Color(0xffbfe25e);
  static const Color _darkSecondaryVariantColor = Color(0xffb5dd43);
  static const Color _darkOnSurfaceColor = Color(0xfff9f9f9);
  
}
