import 'package:fl_news_app/widgets/shared_app_bar.dart';
import 'package:fl_news_app/widgets/shared_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: 'News App',
        appBar: AppBar(),
      ),
      bottomNavigationBar: SharedBottomAppBar(
        context: context,
        selectedIndex: 2,
      ),
      body: const Center(
        child: Text('Coming soon!'),
      ),
    );
  }
}
