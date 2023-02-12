import 'package:json_annotation/json_annotation.dart';

part 'sources.g.dart';

@JsonSerializable()
class Source {
  const Source(
      {required this.id,
      required this.name,
      required this.description,
      required this.url,
      required this.category,
      required this.language,
      required this.country});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;
}

@JsonSerializable()
class Sources {
  const Sources({required this.status, required this.sources});

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  final String? status;
  final List<Source>? sources;
}
