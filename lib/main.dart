import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/app.dart';
import 'package:rick_and_morty/core/di/injection.dart';

void main() {
  setupDependencies();
  runApp(const App());
}
