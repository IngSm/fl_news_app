import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({Key? key, required this.title, required this.appBar})
      : super(key: key);

  final AppBar appBar;
  final String title;

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
          onPressed: () {
            print('!!!');
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
