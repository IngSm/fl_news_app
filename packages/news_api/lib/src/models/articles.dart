import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

@JsonSerializable()
class ArtSource {
  const ArtSource({required this.id, required this.name});

  factory ArtSource.fromJson(Map<String, dynamic> json) => ArtSource(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  final String? id;
  final String? name;
}

@JsonSerializable()
class Article {
  const Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: ArtSource.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };

  final ArtSource? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
}

@JsonSerializable()
class Articles {
  const Articles(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        status: json["status"],
        totalResults: json["totalResult"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  final String? status;
  final int? totalResults;
  final List<Article>? articles;
}
