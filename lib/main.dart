import 'package:flutter/material.dart';
import 'package:lokal_test/model/news-model.dart';
import 'package:lokal_test/provider/news-provider.dart';
import 'package:lokal_test/screens/home-screen.dart';
import 'package:lokal_test/screens/news-screen.dart';
import 'package:lokal_test/screens/saved-articles.dart';
import 'package:lokal_test/screens/search-screen.dart';
import 'package:lokal_test/screens/splash-screen.dart';
import 'package:lokal_test/widgets/article-screen.dart';
import 'package:provider/provider.dart';

import 'provider/saved-provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (ctx) => NewsProvider()
        ),
        ChangeNotifierProvider(
            create: (ctx) => SavedProvider()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const SplashScreen(),
        routes: {
          NewsScreen.routeName : (ctx) => const NewsScreen(category: 'general', country: 'in'),
          SearchScreen.routeName : (ctx) => const SearchScreen(),
          SavedArticles.routeName : (ctx) => const SavedArticles(),
          HomeScreen.routeName : (ctx) => const HomeScreen(),
          ArticleScreen.routeName : (ctx) => const ArticleScreen()
        },
      ),
    );
  }
}




