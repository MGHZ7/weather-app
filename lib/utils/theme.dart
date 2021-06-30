import 'package:flutter/material.dart';

class ThemeGenerator {
  static final ThemeGenerator _instance = ThemeGenerator._internal();
  ThemeGenerator._internal();

  factory ThemeGenerator() => _instance;

  ThemeData generateTheme(ThemeData theme) {
    return theme.copyWith(
        colorScheme: ColorScheme(
            surface: Colors.black45,
            primary: Colors.white,
            primaryVariant: Colors.white54,
            secondary: Colors.deepPurpleAccent,
            secondaryVariant: Colors.deepPurple,
            onPrimary: Colors.deepPurple,
            background: Colors.black12,
            brightness: Brightness.light,
            error: Colors.redAccent,
            onBackground: Colors.white,
            onError: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.white),
        textTheme: TextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white));
  }
}
