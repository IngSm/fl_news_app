import 'package:fl_news_app/sources/sources.dart';
import 'package:fl_news_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';

class SourcesPage extends StatelessWidget {
  const SourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourcesCubit(context.read<NewsRepository>()),
      child: const SourcesView(),
    );
  }
}

class SourcesView extends StatefulWidget {
  const SourcesView({super.key});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  @override
  void initState() {
    super.initState();
    context.read<SourcesCubit>().fetchSources('us');
  }

  String country = 'us';

  Future _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CountrySelection(value: country));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'News App'.toUpperCase(),
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: BlocConsumer<SourcesCubit, SourcesState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                print('SUCCESS!');
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case SourcesStatus.initial:
                  return const NewsEmpty();
                case SourcesStatus.loading:
                  return const NewsLoading();
                case SourcesStatus.success:
                  return SourcesPopulated(
                    sources: state.sources,
                  );
                case SourcesStatus.failure:
                  return const NewsError();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.search,
            semanticLabel: 'Search', color: Color(0xFFF7F5DD)),
        onPressed: () async {
          final country = await _showDialog();
          if (!mounted) return;
          await context.read<SourcesCubit>().fetchSources(country);
        },
      ),
    );
  }
}
