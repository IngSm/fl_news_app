import 'package:fl_news_app/headlines/headlines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headlines_repository/headlines_repository.dart';

class HeadlinesPage extends StatelessWidget {
  const HeadlinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeadlinesCubit(context.read<HeadlinesRepository>()),
      child: const HeadlinesView(),
    );
  }
}

class HeadlinesView extends StatefulWidget {
  const HeadlinesView({super.key});

  @override
  State<HeadlinesView> createState() => _HealinesViewState();
}

class _HealinesViewState extends State<HeadlinesView> {
  @override
  void initState() {
    super.initState();
    context.read<HeadlinesCubit>().fetchHeadlines('us');
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
          child: BlocConsumer<HeadlinesCubit, HeadlinesState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                print('SUCCESS!');
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case HeadlinesStatus.initial:
                  return const HeadlinesEmpty();
                case HeadlinesStatus.loading:
                  return const HeadlinesLoading();
                case HeadlinesStatus.success:
                  return HeadlinesPopulated(
                    headlines: state.headlines,
                  );
                case HeadlinesStatus.failure:
                  return const HeadlinesError();
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
          await context.read<HeadlinesCubit>().fetchHeadlines(country);
        },
      ),
    );
  }
}
