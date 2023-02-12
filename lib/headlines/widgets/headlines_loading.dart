import 'package:flutter/material.dart';

class HeadlinesLoading extends StatelessWidget {
  const HeadlinesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('📰', style: TextStyle(fontSize: 64)),
        Text(
          'Loading Headlines',
          style: theme.textTheme.headlineSmall,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
