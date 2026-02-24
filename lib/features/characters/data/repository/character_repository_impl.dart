import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/features/characters/data/datasource/character_remote_datasource.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/entities/characters_response.dart';
import 'package:rick_and_morty/features/characters/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<CharactersResponse> getCharacters(int page) async {
    try {
      final charactersResponse = await remoteDataSource.getCharacters(page);

      final characters = charactersResponse.characters
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

      return CharactersResponse(
        characters: characters,
        totalCount: charactersResponse.totalCount,
        totalPages: charactersResponse.totalPages,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (statusCode == 429) {
        throw TooManyRequestsFailure();
      }

      if (statusCode != null && statusCode >= 500) {
        throw ServerFailure();
      }
      throw NetworkFailure();
    } catch (_){
      throw UnknownFailure();
    }
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
