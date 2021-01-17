import 'package:desafio27/app/teste_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network('https://avatars2.githubusercontent.com/u/4654514?s=400&u=eb927206d1e73ccc297f0a7911f4c8892bc3900f&v=4'),
                ),
                accountEmail: Text('bwolf@bwolf.com'),
                accountName: Text('bwolf'),
              ),
              ListTile(
                title: Text(TesteController.instance.isDarkTheme ? 'LightMode' : 'DarkMode'),
                leading: Icon(Icons.adjust),
                onTap: () {
                  TesteController.instance.changeTheme();
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Switch(
            value: TesteController.instance.isDarkTheme,
            onChanged: (value) {
              TesteController.instance.changeTheme();
            }),
      ),
    );
  }
}
