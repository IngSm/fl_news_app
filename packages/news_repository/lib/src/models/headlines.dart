import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_api/news_api.dart';

part 'headlines.g.dart';

// @JsonSerializable()
// class ArtSourceRep extends Equatable {
//   const ArtSourceRep({required this.id, required this.name});
//
//   factory ArtSourceRep.fromJson(Map<String, dynamic> json) =>
//       _$ArtSourceRepFromJson(json);
//
//   final String? id;
//   final String? name;
//
//   @override
//   List<Object?> get props => [id, name];
// }
//
// @JsonSerializable()
// class ArticleRep extends Equatable {
//   const ArticleRep(
//       {required this.source,
//       required this.author,
//       required this.title,
//       required this.description,
//       required this.url,
//       required this.urlToImage,
//       required this.publishedAt,
//       required this.content});
//
//   factory ArticleRep.fromJson(Map<String, dynamic> json) =>
//       _$ArticleRepFromJson(json);
//
//   final ArtSourceRep? source;
//   final String? author;
//   final String? title;
//   final String? description;
//   final String? url;
//   final String? urlToImage;
//   final String? publishedAt;
//   final String? content;
//
//   Map<String, dynamic> toJson() => _$ArticleRepToJson(this);
//
//   @override
//   List<Object?> get props => [
//         source,
//         author,
//         title,
//         description,
//         url,
//         urlToImage,
//         publishedAt,
//         content
//       ];
// }

@JsonSerializable()
class Headlines extends Equatable {
  const Headlines({
    required this.articles,
  });

  factory Headlines.fromJson(Map<String, dynamic> json) =>
      _$HeadlinesFromJson(json);

  Map<String, dynamic> toJson() => _$HeadlinesToJson(this);

  final List<Article>? articles;

  @override
  List<Object?> get props => [articles];
}
