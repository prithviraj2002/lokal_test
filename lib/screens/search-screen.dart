import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lokal_test/provider/news-provider.dart';
import 'package:provider/provider.dart';

import '../model/news-model.dart';
import '../widgets/news-tile.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search-screen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController searchText = TextEditingController();
  List news = [];
  final dio = Dio();

  void getNews(String text) async{
    if(text.isEmpty){
      return;
    }
    else{
      List<News> tempList = [];
      final response = await dio.get("https://newsapi.org/v2/everything?q=$text&apiKey=8624a6fc3d0f435499088d9f2103f33d");
      final extractedArticles = response.data['articles'];
      for(Map<String, dynamic> a in extractedArticles){
        tempList.add(News.fromJson(a));
      }
      setState((){
        news = tempList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: TextFormField(
          controller: searchText,
          onFieldSubmitted: (value){
            if(searchText.text.isNotEmpty) {
              getNews(searchText.text);
            }
          },
          decoration: InputDecoration(
              hintText: "Search here",
              icon: IconButton(
                  onPressed: () {
                    getNews(searchText.text);
                  },
                  icon: const Icon(Icons.search))
          ),
          validator: (value){
            if(value == null){
              return "Cannot have empty value to search!";
            }
          },
        ),
      ),
      body: news.isEmpty ? const Center(child: Text('Nothing here'))
      : ListView.builder(
          itemBuilder: (ctx, index){
            return NewsTile(n: news[index]);
          },
        itemCount: news.length,
      )
    );
  }
}
