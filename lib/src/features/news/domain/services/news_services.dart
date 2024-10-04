import 'package:blott/src/features/news/domain/dtos/response/news_list_response.dart';
import 'package:dartz/dartz.dart';
import 'package:blott/src/config/network/failures.dart';
import 'package:blott/src/features/news/data/news_api.dart';

abstract class NewsService {
  Future<Either<Failure, NewsResponse>> getAllNews(
      String category, String apikey);
}

class NewsServiceImpl implements NewsService {
  NewsApi newsApi;
  NewsServiceImpl({required this.newsApi});

  @override
  Future<Either<Failure, NewsResponse>> getAllNews(
      String category, String apikey) {
    return newsApi.getAllNews(category, apikey);
  }
}
