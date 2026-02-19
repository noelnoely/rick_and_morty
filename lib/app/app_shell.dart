import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/bloc/app_shell_bloc.dart';
import 'package:rick_and_morty/app/bloc/app_shell_event.dart';
import 'package:rick_and_morty/app/bloc/app_shell_state.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppShellBloc(),
      child: BlocBuilder<AppShellBloc, AppShellState>(
        builder: (context, state) {
          final index = state.index;

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Rick & Morty",
              ),
            ),
            body: IndexedStack(
              index: index,
              children: [
                const Center(child: Text("Characters")),
                const Center(child: Text("Categories")),
                const Center(child: Text("Favorites")),
                const Center(child: Text("Profile")),
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
                  label: "Categories",
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
      ),
    );
  }
}
