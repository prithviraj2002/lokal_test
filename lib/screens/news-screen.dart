import 'package:flutter/material.dart';
import 'package:lokal_test/widgets/news-tile.dart';
import 'package:provider/provider.dart';

import '../model/news-model.dart';
import '../provider/news-provider.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = '/news-screen';
  final String category;
  final String country;
  const NewsScreen({required this.category, required this.country, Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NewsProvider>(context).getNews(widget.category, widget.country),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<News> newsData = snapshot.data;
            return Scaffold(
              body: ListView.builder(
                shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return NewsTile(n: newsData[index]);
                  },
                itemCount: newsData.length,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
