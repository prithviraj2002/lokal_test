import 'package:flutter/material.dart';

import '../model/news-model.dart';

class ArticleScreen extends StatefulWidget {
  static const routeName = '/article-screen';
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final article = args as News;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 250.0,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                article.imageUrl,
                fit: BoxFit.cover,
              )),
        ),
      ];
    },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                thickness: 2,
                color: Colors.red,
              ),
              Text(article.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              const Divider(
                thickness: 2,
                color: Colors.red,
              ),
              Text(article.description, style: const TextStyle(fontSize: 22),),
              Text(article.content, style: const TextStyle(fontSize: 22),),
            ],
          ),
        ),
      ),
      )
    );
  }
}
