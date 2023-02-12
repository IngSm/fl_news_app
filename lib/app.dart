import 'package:fl_news_app/headlines/headlines.dart';
import 'package:fl_news_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headlines_repository/headlines_repository.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required HeadlinesRepository headlinesRepository})
      : _headlinesRepository = headlinesRepository;

  final HeadlinesRepository _headlinesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _headlinesRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: const NewsAppView(),
      ),
    );
  }
}

class NewsAppView extends StatelessWidget {
  const NewsAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, color) {
        return MaterialApp(
          theme: ThemeData(
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
              textTheme: GoogleFonts.getTextTheme('Indie Flower')
                  .apply(bodyColor: const Color(0xFFF7F5DD))),
          home: const HeadlinesPage(),
        );
      },
    );
  }
}
