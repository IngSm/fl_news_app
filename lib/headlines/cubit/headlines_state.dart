part of 'headlines_cubit.dart';

enum HeadlinesStatus { initial, loading, success, failure }

extension HeadlinesStatusX on HeadlinesStatus {
  bool get isInitial => this == HeadlinesStatus.initial;
  bool get isLoading => this == HeadlinesStatus.loading;
  bool get isSuccess => this == HeadlinesStatus.success;
  bool get isFailure => this == HeadlinesStatus.failure;
}

@JsonSerializable()
class HeadlinesState extends Equatable {
  HeadlinesState({
    this.status = HeadlinesStatus.initial,
    Headlines? headlines,
  }) : headlines = headlines ?? Headlines.empty;

  factory HeadlinesState.fromJson(Map<String, dynamic> json) =>
      _$HeadlinesStateFromJson(json);

  final HeadlinesStatus status;
  final Headlines headlines;

  HeadlinesState copyWith({
    HeadlinesStatus? status,
    Headlines? headlines,
  }) {
    return HeadlinesState(
      status: status ?? this.status,
      headlines: headlines ?? this.headlines,
    );
  }

  Map<String, dynamic> toJson() => _$HeadlinesStateToJson(this);

  @override
  List<Object?> get props => [status, headlines];
}
