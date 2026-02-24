import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';

class CharactersResponseModel extends Equatable {
  final List<CharacterModel> characters;
  final int totalPages;
  final int totalCount;

  const CharactersResponseModel({
    required this.characters,
    required this.totalPages,
    required this.totalCount,
  });

  @override
  List<Object?> get props => [
    characters,
    totalPages,
    totalCount,
  ];

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) {
    final info = json['info'] as Map<String, dynamic>;
    final results = json['results'] as List;
    return CharactersResponseModel(
      characters: results
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: info["pages"] as int,
      totalCount: info["count"] as int,
    );
  }
}
