import 'dart:convert';

import 'package:blott/src/features/news/domain/dtos/response/news_list_response.dart';
import 'package:dartz/dartz.dart';
import 'package:blott/src/config/network/api_client.dart';
import 'package:blott/src/config/network/api_endpoints.dart';
import 'package:blott/src/config/network/failures.dart';
import 'package:blott/src/config/utils/exceptions.dart';

abstract class NewsApi {
  Future<Either<Failure, NewsResponse>> getAllNews(
      String category, String apikey);
}

class NewsApiImpl implements NewsApi {
  ApiClient apiClient;
  NewsApiImpl(this.apiClient);

  @override
  Future<Either<Failure, NewsResponse>> getAllNews(
      String category, String apikey) async {
    try {
      final response = await apiClient.getData(
        news.allNews(category, apikey),
        extraHeaders: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      return Right(NewsResponse.fromJson(jsonDecode(response.body)));
    } on ApiException catch (err) {
      return Left(ApiFailure(message: err.toString()));
    }
  }
}
