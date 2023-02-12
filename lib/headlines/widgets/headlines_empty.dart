import 'package:flutter/material.dart';

class HeadlinesEmpty extends StatelessWidget {
  const HeadlinesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🏙️', style: TextStyle(fontSize: 64)),
        Text(
          'Please Select a Country!',
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
