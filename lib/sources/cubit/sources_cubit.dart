import 'package:equatable/equatable.dart';
import 'package:fl_news_app/sources/sources.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
import 'package:news_repository/news_repository.dart' show NewsRepository;

part 'sources_cubit.g.dart';
part 'sources_state.dart';

class SourcesCubit extends HydratedCubit<SourcesState> {
  SourcesCubit(this._newsRepository) : super(SourcesState());

  final NewsRepository _newsRepository;
  var logger = Logger();

  Future<void> fetchSources(String? country) async {
    if (country == null || country.isEmpty) return;

    emit(state.copyWith(status: SourcesStatus.loading));

    try {
      logger.i('Fetching sources...');
      final sources = Sources.fromRepository(
          await _newsRepository.getSources(country: country));
      emit(state.copyWith(status: SourcesStatus.success, sources: sources));
    } on Exception catch (e) {
      logger.e('Something went wrong while fetching! $e');
      emit(state.copyWith(status: SourcesStatus.failure));
    }
  }

  @override
  SourcesState fromJson(Map<String, dynamic> json) =>
      SourcesState.fromJson(json);

  @override
  Map<String, dynamic> toJson(SourcesState state) => state.toJson();
}
