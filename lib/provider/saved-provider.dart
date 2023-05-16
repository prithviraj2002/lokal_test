import 'package:flutter/material.dart';

import '../model/news-model.dart';

class SavedProvider with ChangeNotifier{
  List<News> _articles = [];

  List<News> get articles{
    return [..._articles];
  }

  void addArticle(News n){
    _articles.add(n);
    notifyListeners();
  }

  void delArticle(News n){
    _articles.remove(n);
    notifyListeners();
  }
}