part of 'sources_cubit.dart';

enum SourcesStatus { initial, loading, success, failure }

extension SourcesStatusX on SourcesStatus {
  bool get isInitial => this == SourcesStatus.initial;
  bool get isLoading => this == SourcesStatus.loading;
  bool get isSuccess => this == SourcesStatus.success;
  bool get isFailure => this == SourcesStatus.failure;
}

@JsonSerializable()
class SourcesState extends Equatable {
  SourcesState({
    this.status = SourcesStatus.initial,
    Sources? sources,
  }) : sources = sources ?? Sources.empty;

  factory SourcesState.fromJson(Map<String, dynamic> json) =>
      _$SourcesStateFromJson(json);

  final SourcesStatus status;
  final Sources sources;

  SourcesState copyWith({
    SourcesStatus? status,
    Sources? sources,
  }) {
    return SourcesState(
      status: status ?? this.status,
      sources: sources ?? this.sources,
    );
  }

  Map<String, dynamic> toJson() => _$SourcesStateToJson(this);

  @override
  List<Object?> get props => [status, sources];
}
