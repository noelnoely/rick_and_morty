import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_item.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as Character;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,

          children: [
            SizedBox(
              width: double.maxFinite,
              child: CharacterItem(
                id: character.id,
                image: character.image,
                name: character.name,
                status: character.status,
                onTap: () {},
                isDetail: true,
              ),
            ),
            const SizedBox(height: 24),

            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  character.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: switch (character.status) {
                        "Alive" => Colors.green,
                        "Dead" => Colors.red,
                        "unknown" => Colors.blueGrey,
                        _ => Colors.blueGrey,
                      },
                      radius: 8,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "${character.status} - ${character.species}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  character.episodeUrls.length,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 12),
                      decoration: const BoxDecoration(color: Colors.blue),
                      height: 50,
                      width: 50,
                      child: Text((index + 1).toString()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
