import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_api/news_api.dart';

part 'sources.g.dart';

@JsonSerializable()
class Sources extends Equatable {
  const Sources({
    required this.sources,
  });

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesToJson(this);

  final List<Source>? sources;

  @override
  List<Object?> get props => [sources];
}
