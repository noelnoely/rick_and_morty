import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const AppErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        key: ValueKey(message),
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/images/ricksanchez.svg",
            height: 300,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: Icon(
              Icons.refresh_outlined,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            label: Text(
              "Retry",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color(0xFFff9800),
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
