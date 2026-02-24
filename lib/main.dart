import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/app/app.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/features/favorites/data/models/favorite_character_hive_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteCharacterHiveModelAdapter());
  await Hive.openBox<FavoriteCharacterHiveModel>("favorites");
  setupDependencies();
  runApp(const App());
}
