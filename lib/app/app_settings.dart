import 'package:flutter/material.dart';

abstract class AppSettings {
  static final themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

  static void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
