import 'package:rick_and_morty/features/characters/data/datasource/character_remote_datasource.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Character>> getCharacters(int page) async {
    final models = await remoteDataSource.getCharacters(page);

    return models
        .map(
          (model) => Character(
            id: model.id,
            name: model.name,
            status: model.status,
            species: model.species,
            image: model.image,
            episodeUrls: model.episodeUrls,
          ),
        )
        .toList();
  }

  @override
  Future<Character> getCharacterById(int id) async {
    final model = await remoteDataSource.getCharacterById(id);

    return Character(
      id: model.id,
      name: model.name,
      status: model.status,
      species: model.species,
      image: model.image,
      episodeUrls: model.episodeUrls,
    );
  }
}
