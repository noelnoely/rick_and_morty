import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/app_settings.dart';
import 'package:rick_and_morty/app/app_shell.dart';
import 'package:rick_and_morty/app/bloc/app_shell_bloc.dart';
import 'package:rick_and_morty/core/router/app_router.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_event.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppShellBloc(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<FavoritesBloc>()..add(const FavoritesRequested()),
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
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
      ),
    );
  }
}
