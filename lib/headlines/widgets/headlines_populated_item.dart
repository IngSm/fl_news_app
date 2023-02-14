import 'package:flutter/material.dart';
import 'package:headlines_repository/headlines_repository.dart';
import 'package:intl/intl.dart';

class HeadlinesPopulatedItem extends StatelessWidget {
  const HeadlinesPopulatedItem({Key? key, required this.article})
      : super(key: key);

  final Article? article;

  @override
  Widget build(BuildContext context) {
    final parsedPublishDate =
        DateFormat.yMMMd().format(article?.publishedAt as DateTime);
    return Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              Text(
                article?.title ?? '',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFF5F6),
                ),
              ),
              Text(
                article?.description ?? '',
                style: const TextStyle(fontSize: 20),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  parsedPublishDate,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFFFFF5F6),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
