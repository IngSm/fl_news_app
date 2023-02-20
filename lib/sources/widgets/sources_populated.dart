import 'package:fl_news_app/sources/sources.dart';
import 'package:flutter/material.dart';

class SourcesPopulated extends StatelessWidget {
  const SourcesPopulated({super.key, required this.sources});

  final Sources sources;

  @override
  Widget build(BuildContext context) {
    final items = sources.sources ?? [];
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return SourcesPopulatedItem(source: item);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
    // return Scaffold(
    //     body: ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     final item = items[index];
    //     return HeadlinesPopulatedItem(
    //         title: items[index].title ?? '',
    //         description: items[index].description ?? '');
    //   },
    // ));
  }
}
