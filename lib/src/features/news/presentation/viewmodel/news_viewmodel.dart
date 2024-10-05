import 'dart:async';
import 'package:blott/src/core/utils/app_const/app_strings.dart';
import 'package:blott/src/features/news/domain/dtos/response/news_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:blott/src/features/news/domain/services/news_services.dart';

class NewsViewModel extends ChangeNotifier {
  NewsService newsService;

  NewsViewModel(this.newsService);

  bool? _isLoading;

  bool? get isLoading => _isLoading;

  List<NewsArticle>? _news;
  List<NewsArticle>? get news => _news;

  Future<void> getAllNews(String category) async {
    _news = [];
    _isLoading = true;
    notifyListeners();
    final response = await newsService.getAllNews(category, AppStrings.API_KEY);
    _isLoading = false;
    notifyListeners();
    response.fold((failure) {
      print('failed in get to do view model');
      print(failure.message);
    }, (success) async {
      _news = success.articles!;
      notifyListeners();
    });
  }
}
