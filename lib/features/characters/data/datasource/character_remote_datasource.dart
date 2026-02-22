import 'package:rick_and_morty/core/api/api_client.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';

class CharacterRemoteDataSource {
  final ApiClient apiClient;

  const CharacterRemoteDataSource(this.apiClient);

  Future<List<CharacterModel>> getCharacters(int page) async {
    final response = await apiClient.getCharacters(page);

    final results = response["results"];

    return (results as List)
        .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<CharacterModel> getCharacterById(int id) async {
    final response = await apiClient.getCharacterById(id);
    return CharacterModel.fromJson(response);
  }
}
