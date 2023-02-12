import 'package:equatable/equatable.dart';
import 'package:fl_news_app/headlines/headlines.dart';
import 'package:headlines_repository/headlines_repository.dart'
    show HeadlinesRepository;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';

part 'headlines_cubit.g.dart';
part 'headlines_state.dart';

class HeadlinesCubit extends HydratedCubit<HeadlinesState> {
  HeadlinesCubit(this._headlinesRepository) : super(HeadlinesState());

  final HeadlinesRepository _headlinesRepository;
  var logger = Logger();

  Future<void> fetchHeadlines(String? country) async {
    if (country == null || country.isEmpty) return;

    emit(state.copyWith(status: HeadlinesStatus.loading));

    try {
      logger.i('Fetching headlines...');
      final headlines = Headlines.fromRepository(
          await _headlinesRepository.getHeadlines(country: country));
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

  // TODO: implement method, but before add `country` field to repo.
  // Future<void> refreshHeadlines() async {
  //   if (!state.status.isSuccess) return;
  //   if (state.headlines == Headlines.empty) return;
  //   try {
  //     final healines = Headlines.fromRepository(await _headlinesRepository.getHeadlines());
  //   }
  // }
}
