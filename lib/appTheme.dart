import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightSurfaceColor = Colors.white;
  static const Color _lightSurfaceVariantColor = Color(0xffF9F9F9);

  static const Color _lightPrimaryColor = Color(0xff5E7CE2);
  static const Color _lightPrimaryVariantColor = Color(0xff91a1ea);
  static const Color _lightSecondaryColor = Color(0xff63F5EF);
  static const Color _lightSecondaryVariantColor = Color(0xffa9f9f4);
  static const Color _lightOnSurfaceColor = Color(0xff333333);

  static final ThemeData lightTheme = ThemeData(
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
          onBackground: _lightSurfaceColor,
          onError: _lightSurfaceColor,
          brightness: Brightness.dark
          ));
}
