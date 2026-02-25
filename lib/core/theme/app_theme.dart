import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    final colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primary,
      onPrimary: AppLightColors.onPrimary,
      secondary: AppLightColors.secondary,
      onSecondary: AppLightColors.onSecondary,
      error: AppLightColors.error,
      onError: AppLightColors.onError,
      surface: AppLightColors.surface,
      onSurface: AppLightColors.onSurface,
    );

    final textTheme = AppTextTheme.forScheme(colorScheme);
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: "Roboto",
    );
  }

  static ThemeData dark() {
    final colorScheme = const ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: AppDarkColors.onPrimary,
      secondary: AppDarkColors.secondary,
      onSecondary: AppDarkColors.onSecondary,
      error: AppDarkColors.error,
      onError: AppDarkColors.onError,
      surface: AppDarkColors.surface,
      onSurface: AppDarkColors.onSurface,
    );

    final textTheme = AppTextTheme.forScheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }
}

abstract class AppLightColors {
  static const primary = Color(0xFFFFFFFF);
  static const onPrimary = Color(0xFF24282F);
  static const secondary = Color(0xFFF5F5F5);
  static const onSecondary = Color(0xFF24282F);
  static const error = Color(0xFFD63D2E);
  static const onError = Color(0xFFFFFFFF);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF424242);
}

abstract class AppDarkColors {
  static const primary = Color(0xFF24282F);
  static const onPrimary = Color(0xFFFFFFFF);
  static const secondary = Color(0xFF3C3E44);
  static const onSecondary = Color(0xFFFFFFFF);
  static const error = Color(0xFFD63D2E);
  static const onError = Color(0xFFFFFFFF);
  static const surface = Color(0xFF24282F);
  static const onSurface = Color(0xFF9E9E9E);
}

abstract class AppTextTheme {
  static TextTheme forScheme(
    ColorScheme cs,
  ) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.15,
        color: cs.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.15,
        color: cs.onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: cs.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: cs.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: cs.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: cs.onSurface,
      ),
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: cs.onSurface,
      ),
      labelMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: cs.onSurface,
      ),
    );
  }
}
