import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/app_settings.dart';
import 'package:rick_and_morty/app/bloc/app_shell_bloc.dart';
import 'package:rick_and_morty/app/bloc/app_shell_event.dart';
import 'package:rick_and_morty/app/bloc/app_shell_state.dart';
import 'package:rick_and_morty/features/characters/presentation/pages/characters_page.dart';
import 'package:rick_and_morty/features/episodes/presentation/pages/episodes_page.dart';
import 'package:rick_and_morty/features/favorites/presentation/pages/favorites_page.dart';
import 'package:rick_and_morty/features/profile/presentation/pages/profile_page.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppShellBloc, AppShellState>(
      builder: (context, state) {
        final index = state.index;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Rick & Morty",
            ),
            actions: [
              IconButton(
                onPressed: () {
                  AppSettings.toggleTheme();
                },
                icon: Theme.of(context).brightness == Brightness.light
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
              ),
            ],
          ),
          body: IndexedStack(
            index: index,
            children: [
              const CharactersPage(),
              const EpisodesPage(),
              const FavoritesPage(),
              const ProfilePage(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (value) {
              context.read<AppShellBloc>().add(AppShellTabChanged(value));
            },
            selectedIndex: index,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: "Characters",
              ),
              const NavigationDestination(
                icon: Icon(Icons.category_outlined),
                label: "Episodes",
              ),
              const NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: "Favorites",
              ),
              const NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
