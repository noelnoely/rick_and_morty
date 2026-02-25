import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final String image;
  final String name;
  final int id;
  final VoidCallback onTap;
  final bool isDetail;
  final String status;
  final bool? isSelected;
  final VoidCallback? onFavoriteTap;
  final bool enableHero;
  final bool enabledFavoriteToggle;

  const CharacterItem({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.onTap,
    this.isDetail = false,
    required this.status,
    this.isSelected,
    this.onFavoriteTap,
    this.enableHero = true,
    this.enabledFavoriteToggle = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
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
                fit: BoxFit.cover,
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
                        padding: const EdgeInsetsGeometry.all(12),
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
                                "unknown" => Colors.grey,
                                _ => Colors.grey,
                              },
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                name,
                                style: Theme.of(context).textTheme.titleLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              enabledFavoriteToggle
                  ? Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton.filledTonal(
                        color: isSelected ?? false ? Colors.red : Colors.grey,
                        onPressed: onFavoriteTap,
                        icon: const Icon(Icons.favorite),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
    return enableHero
        ? Hero(
            tag: id,
            child: content,
          )
        : content;
  }
}
