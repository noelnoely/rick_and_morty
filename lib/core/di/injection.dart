import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rick_and_morty/core/api/api_client.dart';
import 'package:rick_and_morty/features/characters/characters.dart';
import 'package:rick_and_morty/features/characters/data/datasource/character_remote_datasource.dart';
import 'package:rick_and_morty/features/characters/data/repository/character_repository_impl.dart';
import 'package:rick_and_morty/features/favorites/data/datasource/favorites_local_datasource.dart';
import 'package:rick_and_morty/features/favorites/data/models/favorite_character_hive_model.dart';
import 'package:rick_and_morty/features/favorites/data/repository/favorites_repository_impl.dart';
import 'package:rick_and_morty/features/favorites/domain/repository/favorites_repository.dart';
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorites_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  getIt.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSource(getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(getIt<CharacterRemoteDataSource>()),
  );

  getIt.registerFactory<CharactersBloc>(
    () => CharactersBloc(getIt<CharacterRepository>()),
  );

  getIt.registerLazySingleton<Box<FavoriteCharacterHiveModel>>(
    () => Hive.box<FavoriteCharacterHiveModel>("favorites"),
  );

  getIt.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSource(getIt<Box<FavoriteCharacterHiveModel>>()),
  );

  getIt.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(getIt<FavoritesLocalDataSource>()),
  );

  getIt.registerFactory<FavoritesBloc>(
    () => FavoritesBloc(getIt<FavoritesRepository>()),
  );
}
