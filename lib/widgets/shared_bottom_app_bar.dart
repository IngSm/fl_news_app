import 'package:flutter/material.dart';

class SharedBottomAppBar extends StatefulWidget {
  const SharedBottomAppBar(
      {Key? key, required this.context, required this.navigatorKey})
      : super(key: key);

  final BuildContext context;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<SharedBottomAppBar> createState() => _SharedBottomAppBarState();
}

class _SharedBottomAppBarState extends State<SharedBottomAppBar> {
  int _index = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        _index = 0;
        widget.navigatorKey.currentState?.pushNamed('/');
        break;
      case 1:
        _index = 1;
        widget.navigatorKey.currentState?.pushNamed('/sources');
        break;
      case 2:
        _index = 2;
        widget.navigatorKey.currentState?.pushNamed('/articles');
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
      currentIndex: _index,
      selectedItemColor: const Color(0xFFF7F5DD),
      onTap: _onItemTapped,
    );
  }
}
