import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/router/app_router.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/core/widgets/error_widget.dart';
import 'package:rick_and_morty/features/characters/characters.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_item.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_event.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CharactersBloc>()..add(const CharactersPageRequested(1)),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return switch (state) {
            CharactersLoading() || CharactersInitial() => const Center(
              child: CircularProgressIndicator(),
            ),
            CharactersError(:final message) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppErrorWidget(
                message: message,
                onRetry: () {
                  context.read<CharactersBloc>().add(
                    const CharactersRetryRequested(),
                  );
                },
              ),
            ),
            CharactersLoaded(
              :final characters,
              :final currentPage,
              :final totalPages,
            ) =>
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final character = characters[index];

                        final favoritesBloc = context.watch<FavoritesBloc>();
                        final isSelected = favoritesBloc.state.favorites.any(
                          (favorite) => favorite.id == character.id,
                        );
                        return CharacterItem(
                          image: character.image,
                          name: character.name,
                          id: character.id,
                          status: character.status,
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushNamed(
                              AppRoutes.characterDetail,
                              arguments: character,
                            );
                          },
                          isSelected: isSelected,
                          onFavoriteTap: () {
                            favoritesBloc.add(FavoriteToggled(character));
                          },
                        );
                      }, childCount: characters.length),

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            crossAxisCount: 2,
                          ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsetsGeometry.all(12),
                        child: Row(
                          children: [
                            OutlinedButton(
                              onPressed: currentPage > 1
                                  ? () {
                                      context.read<CharactersBloc>().add(
                                        CharactersPageRequested(
                                          currentPage - 1,
                                        ),
                                      );
                                    }
                                  : null,
                              child: Text(
                                "Prev",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text("Page $currentPage of $totalPages"),
                            const SizedBox(width: 16),
                            OutlinedButton(
                              onPressed: currentPage < totalPages
                                  ? () {
                                      context.read<CharactersBloc>().add(
                                        CharactersPageRequested(
                                          currentPage + 1,
                                        ),
                                      );
                                    }
                                  : null,
                              child: Text(
                                "Next",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
