import 'package:flutter/material.dart';
import 'package:lokal_test/screens/home-screen.dart';
import 'package:lokal_test/screens/saved-articles.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 50,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(bottom: 0),
              child: Center(
                child: Text(
                  'News App',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black38,
            thickness: 1,
          ),
          ListTile(
              title: const Text('Home'),
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              }),
          const Divider(
            color: Colors.black38,
            thickness: 1,
          ),
          ListTile(
            title: const Text('Your saved articles'),
            leading: const Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SavedArticles.routeName);
            },
          ),
          const Divider(
            color: Colors.black38,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
