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
