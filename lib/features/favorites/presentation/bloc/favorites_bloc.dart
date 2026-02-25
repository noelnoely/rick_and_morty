import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/favorites/domain/repository/favorites_repository.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository repository;

  FavoritesBloc(this.repository) : super(const FavoritesState(favorites: [])) {
    on<FavoritesRequested>(_onFavoritesRequested);
    on<FavoriteToggled>(_onFavoriteToggled);
  }

  void _onFavoritesRequested(
    FavoritesRequested event,
    Emitter<FavoritesState> emit,
  ) {
    final favorites = repository.getFavorites();
    emit(FavoritesState(favorites: favorites));
  }

  void _onFavoriteToggled(
    FavoriteToggled event,
    Emitter<FavoritesState> emit,
  ) {
    final isFavorite = repository.isFavorite(event.character.id);

    if (isFavorite) {
      repository.removeFavorite(event.character.id);
    } else {
      repository.addFavorite(event.character);
    }

    final updatedFavorites = repository.getFavorites();
    emit(FavoritesState(favorites: updatedFavorites));
  }
}
