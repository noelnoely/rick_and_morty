import 'package:hive/hive.dart';
import 'package:rick_and_morty/features/favorites/data/models/favorite_character_hive_model.dart';

class FavoritesLocalDataSource {
  final Box<FavoriteCharacterHiveModel> box;
  const FavoritesLocalDataSource(this.box);

  List<FavoriteCharacterHiveModel> getFavorites() {
    return box.values.toList();
  }

  Future<void> addFavorite(FavoriteCharacterHiveModel character) async {
    await box.put(character.id, character);
  }

  Future<void> removeFavorite(int id) async {
    await box.delete(id);
  }

  bool isFavorite(int id) {
    return box.containsKey(id);
  }
}
