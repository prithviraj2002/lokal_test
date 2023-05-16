import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/news-model.dart';

class NewsProvider with ChangeNotifier{

  final dio = Dio();
  
  Future<List<News>> getNews(String category, String country) async{
    List<News> _articles = [];

    final String url = 'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=8624a6fc3d0f435499088d9f2103f33d';
    try{
      final response = await dio.get(url);
      final newsData = response.data['articles'];
      for(Map<String, dynamic> n in newsData){
        _articles.add(News.fromJson(n));
      }
      final filteredArticles = _articles.where(
              (article) => article.link.isNotEmpty
                  && article.imageUrl.isNotEmpty &&
                  article.content.isNotEmpty &&
                  article.description.isNotEmpty
                  && article.title.isNotEmpty).toList();
      return filteredArticles;
    }
    on Exception{
      rethrow;
    }
  }
}