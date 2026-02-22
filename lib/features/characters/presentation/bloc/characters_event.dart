import 'package:equatable/equatable.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object?> get props => [];
}

final class CharactersRequested extends CharactersEvent {
  const CharactersRequested();
}
