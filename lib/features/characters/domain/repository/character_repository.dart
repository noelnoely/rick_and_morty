import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/entities/characters_response.dart';

abstract class CharacterRepository {
  Future<CharactersResponse> getCharacters(int page);
  Future<Character> getCharacterById(int id);
}
