import 'package:flutter/material.dart';

class SharedBottomAppBar extends StatelessWidget {
  const SharedBottomAppBar(
      {Key? key, required this.context, required this.selectedIndex})
      : super(key: key);

  final int selectedIndex;
  final BuildContext context;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/sources');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/articles');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.newspaper), label: 'Headlines'),
        BottomNavigationBarItem(icon: Icon(Icons.source), label: 'Sources'),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Articles'),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: selectedIndex,
      selectedItemColor: const Color(0xFFF7F5DD),
      onTap: _onItemTapped,
    );
  }
}
