import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/app_settings.dart';
import 'package:rick_and_morty/app/app_shell.dart';
import 'package:rick_and_morty/app/router/app_router.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppSettings.themeMode,
      builder: (context, themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.dark(),
          theme: AppTheme.light(),
          themeMode: themeMode,
          routes: AppRouter.routes,
          home: const AppShell(),
        );
      },
    );
  }
}
