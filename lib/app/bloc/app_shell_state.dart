import 'package:equatable/equatable.dart';

class AppShellState extends Equatable {
  final int index;
  const AppShellState({required this.index});

  @override
  List<Object> get props => [index];
}
