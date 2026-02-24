import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

class CharactersResponse {
  final List<Character> characters;
  final int totalPages;
  final int totalCount;

  const CharactersResponse({
    required this.characters,
    required this.totalPages,
    required this.totalCount,
  });
}
