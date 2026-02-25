import 'package:equatable/equatable.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object?> get props => [];
}

final class CharactersPageRequested extends CharactersEvent {
  final int page;
  final String query;
  const CharactersPageRequested({
    required this.page,
    required this.query,
  });
  @override
  List<Object?> get props => [page];
}

final class CharactersRetryRequested extends CharactersEvent {
  const CharactersRetryRequested();
}
