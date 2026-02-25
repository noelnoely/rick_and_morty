import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_item.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_event.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as Character;
    final favoritesBloc = context.watch<FavoritesBloc>();
    final isSelected = favoritesBloc.state.favorites.any(
      (favorite) => favorite.id == character.id,
    );
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text("Character Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: CharacterItem(
                  id: character.id,
                  image: character.image,
                  name: character.name,
                  status: character.status,
                  onTap: () {},
                  isDetail: true,
                  isSelected: false,
                  onFavoriteTap: () {},
                  enabledFavoriteToggle: false,
                ),
              ),
              Text(
                character.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: switch (character.status) {
                      "Alive" => Colors.green,
                      "Dead" => Colors.red,
                      "unknown" => Colors.grey,
                      _ => Colors.grey,
                    },
                    radius: 8,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${character.status} - ${character.species}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              OutlinedButton.icon(
                onPressed: () {
                  favoritesBloc.add(FavoriteToggled(character));
                },
                icon: Icon(
                  Icons.favorite,
                  color: isSelected
                      ? Colors.red
                      : Theme.of(context).colorScheme.onSurface,
                ),
                label: Text(
                  isSelected ? "Added to favorite" : "Add to favorite",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    character.episodeUrls.length,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        height: 50,
                        width: 50,
                        child: Text(
                          (index + 1).toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
