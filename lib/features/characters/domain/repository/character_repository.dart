import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters(int page);
  Future<Character> getCharacterById(int id);
}
