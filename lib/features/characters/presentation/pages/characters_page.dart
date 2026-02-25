import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/core/router/app_router.dart';
import 'package:rick_and_morty/core/widgets/error_widget.dart';
import 'package:rick_and_morty/features/characters/characters.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_item.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_event.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late final TextEditingController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CharactersBloc>()
            ..add(const CharactersPageRequested(page: 1, query: "")),
      child: BlocConsumer<CharactersBloc, CharactersState>(
        listenWhen: (previous, current) =>
            previous is CharactersLoaded &&
            current is CharactersLoaded &&
            previous.currentPage != current.currentPage,
        listener: (context, state) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
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
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TextField(
                          showCursor: true,
                          cursorColor: Theme.of(context).colorScheme.onSurface,
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Search character...",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onChanged: (value) {
                            context.read<CharactersBloc>().add(
                              CharactersPageRequested(page: 1, query: value),
                            );
                          },
                        ),
                      ),
                    ),
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
                                          page: currentPage - 1,
                                          query: state.currentQuery,
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
                                          page: currentPage + 1,
                                          query: state.currentQuery,
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

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
