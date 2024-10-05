import 'package:blott/src/config/network/config.dart';

final baseUrl = AppConfig.baseUrl;

class _News {
  String allNews(String category, String apikey) =>
      '$baseUrl/news?category=$category&token=$apikey';
}

// endpoints
final news = _News();







// Todo -> Add more Endpoint classes based on what they do


