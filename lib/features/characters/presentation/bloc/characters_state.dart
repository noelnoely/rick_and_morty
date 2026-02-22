import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters/characters.dart';


sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object?> get props => [];
}

final class CharactersInitial extends CharactersState {
  const CharactersInitial();
}

final class CharactersLoading extends CharactersState {
  const CharactersLoading();
}

final class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  const CharactersLoaded({required this.characters});

  @override
  List<Object?> get props => [characters];
}

final class CharactersError extends CharactersState {
  final String message;

  const CharactersError({required this.message});

  @override
  List<Object?> get props => [message];
}
