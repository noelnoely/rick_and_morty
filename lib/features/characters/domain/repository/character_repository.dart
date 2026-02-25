import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/entities/characters_response.dart';

abstract class CharacterRepository {
  Future<CharactersResponse> getCharacters({
    required int page,
    required String query,
  });
  Future<Character> getCharacterById(int id);
}
