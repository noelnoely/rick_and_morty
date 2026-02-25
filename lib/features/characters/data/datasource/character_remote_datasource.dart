import 'package:rick_and_morty/core/api/api_client.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_response_model.dart';

class CharacterRemoteDataSource {
  final ApiClient apiClient;

  const CharacterRemoteDataSource(this.apiClient);

  Future<CharactersResponseModel> getCharacters({
    required int page,
    required String query,
  }) async {
    final response = await apiClient.getCharacters(page: page, query: query);

    return CharactersResponseModel.fromJson(response);
  }

  Future<CharacterModel> getCharacterById(int id) async {
    final response = await apiClient.getCharacterById(id);
    return CharacterModel.fromJson(response);
  }
}
