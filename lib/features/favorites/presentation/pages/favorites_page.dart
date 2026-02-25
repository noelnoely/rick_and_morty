import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/widgets/empty_widget.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_item.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final favorites = state.favorites;

        return favorites.isEmpty
            ? const Center(
                child: AppEmptyWidget(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final character = favorites[index];
                    return Row(
                      spacing: 24,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: CharacterItem(
                            enableHero: false,
                            image: character.image,
                            name: character.name,
                            id: character.id,
                            onTap: () {},
                            status: character.status,
                            isDetail: true,
                            isSelected: state.favorites.any(
                              (favorite) => favorite.id == character.id,
                            ),
                            onFavoriteTap: () {
                              context.read<FavoritesBloc>().add(
                                FavoriteToggled(character),
                              );
                            },
                          ),
                        ),

                        Expanded(
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: switch (character.status) {
                                      "Alive" => Colors.green,
                                      "Dead" => Colors.red,
                                      "unknown" => Colors.grey,
                                      _ => Colors.grey,
                                    },
                                    radius: 6,
                                  ),

                                  Text(
                                    character.status,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              Text(
                                character.species,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
