import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar(
      {Key? key,
      required this.context,
      required this.title,
      required this.appBar})
      : super(key: key);

  final BuildContext context;
  final AppBar appBar;
  final String title;

  void _pressHandler() {
    Navigator.pushNamed(context, '/config');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(color: Color(0xFFF7F5DD), fontSize: 40),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Color(0xFFF7F5DD),
          ),
          onPressed: _pressHandler,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
