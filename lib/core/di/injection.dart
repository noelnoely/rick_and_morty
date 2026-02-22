import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/api/api_client.dart';
import 'package:rick_and_morty/features/characters/data/datasource/character_remote_datasource.dart';
import 'package:rick_and_morty/features/characters/data/repository/character_repository_impl.dart';
import 'package:rick_and_morty/features/characters/domain/repository/character_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  getIt.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSource(getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(getIt<CharacterRemoteDataSource>()),
  );
}
