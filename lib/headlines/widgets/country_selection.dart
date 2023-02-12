import 'package:flutter/material.dart';

class CountrySelection extends StatelessWidget {
  const CountrySelection({Key? key}) : super(key: key);

  void pressHandler(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    final availableCountries = {
      'United Arab Emirates': 'ae',
      'Argentina': 'ar',
      'Russia': 'ru',
      'Germany': 'de',
      'USA': 'us',
      'China': 'cn',
      'Canada': 'ca'
    };

    final listFromCountries = availableCountries.keys as List;

    return SimpleDialog(
      children: [
        ListView.builder(
          itemCount: listFromCountries.length,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              onPressed: () => pressHandler(availableCountries[index]!),
              child: Text(listFromCountries[index]),
            );
          },
        )
      ],
    );
  }
}
