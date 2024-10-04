class NewsArticle {
  final String? category;
  final int? datetime;
  final String? headline;
  final int? id;
  final String? image;
  final String? related;
  final String? source;
  final String? summary;
  final String? url;

  NewsArticle({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      category: json['category'] as String?,
      datetime: json['datetime'] as int?,
      headline: json['headline'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      related: json['related'] as String?,
      source: json['source'] as String?,
      summary: json['summary'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'datetime': datetime,
      'headline': headline,
      'id': id,
      'image': image,
      'related': related,
      'source': source,
      'summary': summary,
      'url': url,
    };
  }
}

class NewsResponse {
  final List<NewsArticle>? articles;

  NewsResponse({this.articles});

  factory NewsResponse.fromJson(List<dynamic> json) {
    return NewsResponse(
      articles: json
          .map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return articles?.map((e) => e.toJson()).toList() ?? [];
  }
}
