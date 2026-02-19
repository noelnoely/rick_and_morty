import 'package:equatable/equatable.dart';

sealed class AppShellEvent extends Equatable {
  const AppShellEvent();
}

final class AppShellTabChanged extends AppShellEvent {
  const AppShellTabChanged(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
