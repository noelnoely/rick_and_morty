import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/favorites/data/datasource/favorites_local_datasource.dart';
import 'package:rick_and_morty/features/favorites/data/models/favorite_character_hive_model.dart';
import 'package:rick_and_morty/features/favorites/domain/repository/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDatasource;
  const FavoritesRepositoryImpl(this.localDatasource);

  @override
  List<Character> getFavorites() {
    final favorites = localDatasource.getFavorites();

    return favorites
        .map(
          (favorite) => Character(
            id: favorite.id,
            name: favorite.name,
            status: favorite.status,
            species: favorite.species,
            image: favorite.image,
            episodeUrls: [],
          ),
        )
        .toList();
  }

  @override
  Future<void> addFavorite(Character character) async {
    final favoriteCharacter = FavoriteCharacterHiveModel(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      image: character.image,
    );

    await localDatasource.addFavorite(favoriteCharacter);
  }

  @override
  Future<void> removeFavorite(int id) async {
    await localDatasource.removeFavorite(id);
  }

  @override
  bool isFavorite(int id) {
    return localDatasource.isFavorite(id);
  }
}
