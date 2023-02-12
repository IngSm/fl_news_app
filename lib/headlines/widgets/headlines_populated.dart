import 'package:fl_news_app/headlines/headlines.dart';
import 'package:fl_news_app/headlines/widgets/headlines_populated_item.dart';
import 'package:flutter/material.dart';

class HeadlinesPopulated extends StatelessWidget {
  const HeadlinesPopulated({super.key, required this.headlines});

  final Headlines headlines;

  @override
  Widget build(BuildContext context) {
    final items = headlines.articles ?? [];
    return Scaffold(
        body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return HeadlinesPopulatedItem(
            title: items[index].title ?? '',
            description: items[index].description ?? '');
      },
    ));
  }
}
