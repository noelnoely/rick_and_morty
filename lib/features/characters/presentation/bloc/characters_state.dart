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
  final int currentPage;
  final int totalPages;
  final String currentQuery;
  const CharactersLoaded({
    required this.characters,
    required this.currentPage,
    required this.totalPages,
    required this.currentQuery,
  });

  @override
  List<Object?> get props => [
    characters,
    currentPage,
    totalPages,
  ];
}

final class CharactersError extends CharactersState {
  final String message;

  const CharactersError({required this.message});

  @override
  List<Object?> get props => [message];
}
