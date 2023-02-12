import 'package:json_annotation/json_annotation.dart';
import 'package:news_api/src/models/models.dart';

part 'headlines.g.dart';

@JsonSerializable()
class Headlines {
  const Headlines(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory Headlines.fromJson(Map<String, dynamic> json) => Headlines(
        status: json["status"],
        totalResults: json["totalResult"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  @override
  String toString() {
    return 'status: $status total: $totalResults articles: $articles';
  }
}
