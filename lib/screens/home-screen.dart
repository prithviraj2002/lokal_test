import 'package:flutter/material.dart';
import 'package:lokal_test/screens/news-screen.dart';
import 'package:lokal_test/screens/search-screen.dart';
import 'package:lokal_test/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/tab-bar-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _dropDownValue = '';

  _HomeScreenState(){
    _dropDownValue = _countries[0]['code'];
  }

  final List<Map<String, dynamic>> _countries = [
    {'name':'India', 'code': 'in'},
    {'name': 'United States', 'code': 'US'},
    {'name': 'Canada', 'code': 'CA'},
    {'name': 'United Kingdom', 'code': 'GB'},
    {'name': 'Argentina', 'code': 'ar'},
    {'name': 'Austria', 'code': 'at'},
    {'name': 'Australia', 'code': 'au'},
    {'name': 'Belgium', 'code': 'bg'},
    {'name': 'Brazil', 'code': 'br'},
    {'name': 'Switzerland', 'code': 'ch'},
    {'name': 'China', 'code': 'cn'},
    {'name': 'Colombia', 'code': 'co'},
    {'name': 'Czechia', 'code': 'cz'},
    {'name': 'Cuba', 'code': 'cu'},
    {'name': 'Germany', 'code': 'de'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            Row(
              children: [
                SizedBox(
                  width: 130,
                  child: DropdownButton<String>(
                    value: _dropDownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropDownValue = newValue!;
                      });
                    },
                    items: _countries.map<DropdownMenuItem<String>>((country) {
                      return DropdownMenuItem<String>(
                        value: country['code'],
                        child: Text(country['name']),
                      );
                    }).toList(),
                    hint: const Text('Select Country'),
                    isExpanded: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushNamed(SearchScreen.routeName);
                    },
                  ),
                )
              ],
            )
          ],
          title: const Row(
            children: [
               Text('True',
                  style: TextStyle(fontWeight: FontWeight.bold)),
               SizedBox(width: 2,),
               Text('Ink',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
          bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.red,
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: 'General'),
                Tab(text: 'Sports'),
                Tab(text: 'Business'),
                Tab(text: 'Science'),
                Tab(text: 'Technology'),
                Tab(text: 'Health'),
                Tab(text: 'Entertainment')
              ]),
        ),
        drawer: const NewsDrawer(),
        body: TabBarView(children: [
          NewsScreen(category: 'general', country: _dropDownValue,),
          NewsScreen(category: 'Sports', country: _dropDownValue),
          NewsScreen(category: 'Business', country: _dropDownValue),
          NewsScreen(category: 'Science', country: _dropDownValue),
          NewsScreen(category: 'Technology', country: _dropDownValue),
          NewsScreen(category: 'Health', country: _dropDownValue),
          NewsScreen(category: 'Entertainment', country: _dropDownValue)
        ]),
      ),
    );
  }
}
