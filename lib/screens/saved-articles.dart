import 'package:flutter/material.dart';
import 'package:lokal_test/widgets/drawer.dart';
import 'package:lokal_test/widgets/news-tile.dart';
import 'package:provider/provider.dart';

import '../model/news-model.dart';
import '../provider/saved-provider.dart';
import '../widgets/saved-news-tile.dart';

class SavedArticles extends StatefulWidget {
  static const routeName = '/saved-articles';
  const SavedArticles({Key? key}) : super(key: key);

  @override
  State<SavedArticles> createState() => _SavedArticlesState();
}

class _SavedArticlesState extends State<SavedArticles> {
  @override
  Widget build(BuildContext context) {
    final List<News> savedNews = Provider.of<SavedProvider>(context).articles;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Saved Articles'),
      ),
      drawer: const NewsDrawer(),
      body: savedNews.isEmpty ? const Center(child: Text(
          'No articles saved yet',
        style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      ),) :
      ListView.builder(
          itemBuilder: (ctx, index) {
            return SavedNewsTile(n: savedNews[index]);
          },
        itemCount: savedNews.length,
      ),
    );
  }
}
