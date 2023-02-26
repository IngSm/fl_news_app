import 'package:fl_news_app/articles/articles.dart';
import 'package:fl_news_app/headlines/headlines.dart';
import 'package:fl_news_app/search_config/search_config.dart';
import 'package:fl_news_app/sources/sources.dart';
import 'package:fl_news_app/theme/theme.dart';
import 'package:fl_news_app/widgets/shared_app_bar.dart';
import 'package:fl_news_app/widgets/shared_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_repository/news_repository.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required NewsRepository newsRepository})
      : _newsRepository = newsRepository;

  final NewsRepository _newsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _newsRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: NewsAppView(),
      ),
    );
  }
}

class NewsAppView extends StatelessWidget {
  NewsAppView({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, color) {
        return MaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              primaryColor: const Color(0xFFBB2649),
              colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0xFFBB2649),
                onPrimary: Color(0xFFBB2649),
                secondary: Color(0xFFBD8185),
                onSecondary: Color(0xFFF7F5DD),
                error: Color(0xFFF51900),
                onError: Color(0xFFF51900),
                background: Color(0xFF574143),
                onBackground: Color(0xFF574143),
                surface: Color(0xFFFFF5F6),
                onSurface: Color(0xFFFFF5F6),
              ),
              brightness: Brightness.dark,
              textTheme: GoogleFonts.getTextTheme('Montserrat Alternates')
                  .apply(bodyColor: const Color(0xFFF7F5DD))),
          home: Scaffold(
            appBar: SharedAppBar(
              navigatorKey: _navigatorKey,
              context: context,
              title: 'News App',
              appBar: AppBar(),
            ),
            bottomNavigationBar: SharedBottomAppBar(
              navigatorKey: _navigatorKey,
              context: context,
            ),
            body: WillPopScope(
              onWillPop: () async {
                if (_navigatorKey.currentState!.canPop()) {
                  _navigatorKey.currentState!.pop();
                  return false;
                }
                return true;
              },
              child: Navigator(
                  key: _navigatorKey,
                  initialRoute: '/',
                  onGenerateRoute: (RouteSettings settings) {
                    return MaterialPageRoute(
                        settings: settings,
                        builder: (BuildContext context) {
                          switch (settings.name) {
                            case '/':
                              return const HeadlinesPage();
                            case '/sources':
                              return const SourcesPage();
                            case '/articles':
                              return const ArticlesPage();
                            case '/config':
                              return const SearchConfig();
                            default:
                              return const HeadlinesPage();
                          }
                        });
                  }),
            ),
          ),
        );
      },
    );
  }
}
