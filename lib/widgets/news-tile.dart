import 'package:flutter/material.dart';
import 'package:lokal_test/provider/saved-provider.dart';
import 'package:lokal_test/widgets/article-screen.dart';
import 'package:provider/provider.dart';

import '../model/news-model.dart';

class NewsTile extends StatefulWidget {
  final News n;
  const NewsTile({required this.n, Key? key}) : super(key: key);

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {

    bool isSaved = false;

    void toggleSave(){
      setState((){
        isSaved = !isSaved;
      });
    }

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
                title: const Text('Save artilce?'),
                content: const Text(
                    'This article will be saved in your saved articles list! Find the saved articles list in the drawer to your left!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Provider.of<SavedProvider>(context, listen: false)
                            .addArticle(widget.n);
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
