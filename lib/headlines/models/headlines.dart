import 'package:equatable/equatable.dart';
import 'package:headlines_repository/headlines_repository.dart'
    as headlines_repository;
import 'package:headlines_repository/headlines_repository.dart' hide Headlines;
import 'package:json_annotation/json_annotation.dart';

part 'headlines.g.dart';

@JsonSerializable()
class Headlines extends Equatable {
  const Headlines({
    required this.lastUpdate,
    required this.articles,
  });

  factory Headlines.fromJson(Map<String, dynamic> json) =>
      _$HeadlinesFromJson(json);

  factory Headlines.fromRepository(headlines_repository.Headlines headlines) {
    return Headlines(
      lastUpdate: DateTime.now(),
      articles: headlines.articles,
    );
  }

  static final empty = Headlines(lastUpdate: DateTime(0), articles: const []);

  final DateTime lastUpdate;
  final List<Article>? articles;

  @override
  List<Object?> get props => [lastUpdate, articles];

  Map<String, dynamic> toJson() => _$HeadlinesToJson(this);

  Headlines copyWith({
    DateTime? lastUpdate,
    List<Article>? articles,
  }) {
    return Headlines(
        lastUpdate: lastUpdate ?? this.lastUpdate,
        articles: articles ?? this.articles);
  }
}
