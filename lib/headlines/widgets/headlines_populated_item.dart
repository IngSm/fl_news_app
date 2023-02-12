import 'package:flutter/material.dart';

class HeadlinesPopulatedItem extends StatelessWidget {
  const HeadlinesPopulatedItem(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
    ));
  }
}
