import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final String image;
  final String name;
  final int id;
  final VoidCallback onTap;
  final bool isDetail;
  final String status;
  const CharacterItem({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
    required this.id,
    this.isDetail = false,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
              width: 3,
            ),
          ),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: const BorderRadiusGeometry.all(Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(
                  width: double.infinity,
                  image,
                  fit: .cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                ),
                isDetail
                    ? const SizedBox.shrink()
                    : Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: const .all(12),
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withAlpha(210),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: switch (status) {
                                  "Alive" => Colors.green,
                                  "Dead" => Colors.red,
                                  "unknown" => Colors.blueGrey,
                                  _ => Colors.blueGrey,
                                },
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  overflow: .ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
