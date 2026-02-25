import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters/characters.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class FavoritesRequested extends FavoritesEvent {
  const FavoritesRequested();
}

final class FavoriteToggled extends FavoritesEvent {
  final Character character;
  const FavoriteToggled(this.character);

  @override
  List<Object?> get props => [character];
}
