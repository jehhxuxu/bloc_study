import 'package:bloc_dynamic_theme/ui/global/preferences/preference_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PreferencePage(),
            )),
          )
        ],
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
