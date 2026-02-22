import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/characters.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository repository;
  CharactersBloc(this.repository) : super(const CharactersInitial()) {
    on<CharactersRequested>(_onCharactersRequested);
  }

  void _onCharactersRequested(
    CharactersRequested event,
    Emitter<CharactersState> emit,
  ) async {
    emit(const CharactersLoading());
    try {
      final characters = await repository.getCharacters(1);
      emit(CharactersLoaded(characters: characters));
    } catch (e) {
      emit(CharactersError(message: e.toString()));
    }
  }
}
