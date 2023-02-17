import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_repository/news_repository.dart' as sources_repository;
import 'package:news_repository/news_repository.dart' hide Sources;

part 'sources.g.dart';

@JsonSerializable()
class Sources extends Equatable {
  const Sources({
    required this.lastUpdate,
    required this.sources,
  });

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  factory Sources.fromRepository(sources_repository.Sources sources) {
    return Sources(
      lastUpdate: DateTime.now(),
      sources: sources.sources,
    );
  }

  static final empty = Sources(lastUpdate: DateTime(0), sources: const []);

  final DateTime lastUpdate;
  final List<Source>? sources;

  @override
  List<Object?> get props => [lastUpdate, sources];

  Map<String, dynamic> toJson() => _$SourcesToJson(this);

  Sources copyWith({
    DateTime? lastUpdate,
    List<Source>? sources,
  }) {
    return Sources(
        lastUpdate: lastUpdate ?? this.lastUpdate,
        sources: sources ?? this.sources);
  }
}
