import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/features/characters/characters.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository repository;
  int _lastRequestedPage = 1;
  String _lastQuery = '';
  CharactersBloc(this.repository) : super(const CharactersInitial()) {
    on<CharactersPageRequested>(_onCharactersNextPageRequested);
    on<CharactersRetryRequested>(_onRetryRequested);
  }

  Future<void> _onCharactersNextPageRequested(
    CharactersPageRequested event,
    Emitter<CharactersState> emit,
  ) async {
    _lastRequestedPage = event.page;
    _lastQuery = event.query;

    if (state is! CharactersLoaded) {
      emit(const CharactersLoading());
    }

    try {
      final response = await repository.getCharacters(
        page: event.page,
        query: event.query,
      );
      print("QUERY: ${event.query}");
      print("RESULT COUNT: ${response.characters.length}");
      emit(
        CharactersLoaded(
          characters: response.characters,
          currentPage: event.page,
          totalPages: response.totalPages,
          currentQuery: event.query,
        ),
      );
    } on Failure catch (failure) {
      emit(
        CharactersError(
          message: _mapFailureToMessage(failure),
        ),
      );
    } catch (_) {
      emit(
        const CharactersError(message: "Something went wrong."),
      );
    }
  }

  Future<void> _onRetryRequested(
    CharactersRetryRequested event,
    Emitter<CharactersState> emit,
  ) async {
    add(CharactersPageRequested(page: _lastRequestedPage, query: _lastQuery));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure) {
      case TooManyRequestsFailure():
        return "Too many requests. Please wait a moment.";
      case ServerFailure():
        return "Server error. Try again later.";
      case ClientFailure():
        return "Request error. Please try again.";
      case NetworkFailure():
        return "No internet connection.";
      default:
        return "Something went wrong.";
    }
  }
}
