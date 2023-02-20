import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';

class SourcesPopulatedItem extends StatelessWidget {
  const SourcesPopulatedItem({Key? key, required this.source})
      : super(key: key);

  final Source? source;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              Text(
                source?.name ?? '',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFF5F6),
                ),
              ),
              Text(
                source?.description ?? '',
                style: const TextStyle(fontSize: 20),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  source?.url ?? '',
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
