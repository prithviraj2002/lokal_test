import 'package:flutter/material.dart';
import 'package:lokal_test/provider/saved-provider.dart';
import 'package:lokal_test/widgets/article-screen.dart';
import 'package:provider/provider.dart';

import '../model/news-model.dart';

class SavedNewsTile extends StatefulWidget {
  final News n;
  const SavedNewsTile({required this.n, Key? key}) : super(key: key);

  @override
  State<SavedNewsTile> createState() => _SavedNewsTileState();
}

class _SavedNewsTileState extends State<SavedNewsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: SizedBox(
          height: 70,
          width: 100,
          child: Image.network(
            widget.n.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          children: [
            Text(widget.n.title, maxLines: 3,),
          ],
        ),
        onTap: () {
          Navigator.of(context).pushNamed(ArticleScreen.routeName, arguments: widget.n);
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Unsave article?'),
                content: const Text(
                    'This article will be removed from your saved articles list!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Provider.of<SavedProvider>(context, listen: false)
                            .delArticle(widget.n);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.red),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ));
        },
      ),
    );
  }
}
