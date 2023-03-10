import 'package:flutter/material.dart';

class SearchConfig extends StatefulWidget {
  const SearchConfig({Key? key}) : super(key: key);

  @override
  State<SearchConfig> createState() => _SearchConfigState();
}

class _SearchConfigState extends State<SearchConfig> {
  final List<String> newsCatrgoryItems = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  var category = 'general';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Keywords...'),
        ),
        DropdownButton(
            items:
                newsCatrgoryItems.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                category = value!;
              });
            })
      ],
    );
  }
}
