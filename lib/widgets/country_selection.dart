import 'package:flutter/material.dart';

class CountrySelection extends StatefulWidget {
  @override
  CountrySelectionState createState() => CountrySelectionState();

  const CountrySelection({super.key, required this.value});

  final String value;
}

class CountrySelectionState extends State<CountrySelection> {
  String value = 'us';

  @override
  void initState() {
    super.initState();
    value = widget.value;
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

    void handleChoice(String country) {
      setState(() {
        value = country;
      });
      Navigator.pop(context, country);
    }

    final listFromCountries = availableCountries.keys.toList();
    final valuesListFromCountries = availableCountries.values.toList();

    return Dialog(
        child: ListView.builder(
      itemCount: listFromCountries.length,
      itemBuilder: (BuildContext context, int index) {
        return TextButton(
          onPressed: () => handleChoice(valuesListFromCountries[index]),
          child: Text(listFromCountries[index],
              style: const TextStyle(color: Color(0xFFF7F5DD))),
        );
      },
    ));
  }
}
