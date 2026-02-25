import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters/characters.dart';

class FavoritesState extends Equatable {
  final List<Character> favorites;

  const FavoritesState({required this.favorites});

  @override
  List<Object?> get props => [favorites];
}
