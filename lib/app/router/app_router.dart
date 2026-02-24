import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/features/characters/presentation/pages/character_detail_page.dart';

abstract class AppRouter {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.characterDetail: (_) => const CharacterDetailPage(),
    };
  }
}

abstract class AppRoutes {
  static const characterDetail = "/characterDetail";
}
