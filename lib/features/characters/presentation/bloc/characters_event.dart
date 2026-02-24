import 'package:equatable/equatable.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object?> get props => [];
}

final class CharactersPageRequested extends CharactersEvent {
  final int page;
  const CharactersPageRequested(this.page);
  @override
  List<Object?> get props => [page];
}

final class CharactersRetryRequested extends CharactersEvent {
  const CharactersRetryRequested();
}
