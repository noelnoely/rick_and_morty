import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/bloc/app_shell_event.dart';
import 'package:rick_and_morty/app/bloc/app_shell_state.dart';

class AppShellBloc extends Bloc<AppShellEvent, AppShellState> {
  AppShellBloc() : super(const AppShellState(index: 0)) {
    on<AppShellTabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    AppShellTabChanged event,
    Emitter<AppShellState> emit,
  ) {
    if (state.index == event.index) return;
    emit(AppShellState(index: event.index));
  }
}
