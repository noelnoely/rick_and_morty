import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

abstract class FavoritesRepository {
  List<Character> getFavorites();

  Future<void> addFavorite(Character character);

  Future<void> removeFavorite(int id);

  bool isFavorite(int id);
}
