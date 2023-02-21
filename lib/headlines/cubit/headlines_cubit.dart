import 'package:equatable/equatable.dart';
import 'package:fl_news_app/headlines/headlines.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
import 'package:news_repository/news_repository.dart' show NewsRepository;

part 'headlines_cubit.g.dart';
part 'headlines_state.dart';

class HeadlinesCubit extends HydratedCubit<HeadlinesState> {
  HeadlinesCubit(this._newsRepository) : super(HeadlinesState());

  final NewsRepository _newsRepository;
  var logger = Logger();

  Future<void> fetchHeadlines(Map<String, String> params) async {
    emit(state.copyWith(status: HeadlinesStatus.loading));

    try {
      logger.i('Fetching headlines...');
      final headlines =
          Headlines.fromRepository(await _newsRepository.getHeadlines(params));
      emit(state.copyWith(
          status: HeadlinesStatus.success, headlines: headlines));
    } on Exception catch (e) {
      logger.e('Something went wrong while fetching! $e');
      emit(state.copyWith(status: HeadlinesStatus.failure));
    }
  }

  @override
  HeadlinesState fromJson(Map<String, dynamic> json) =>
      HeadlinesState.fromJson(json);

  @override
  Map<String, dynamic> toJson(HeadlinesState state) => state.toJson();
}
