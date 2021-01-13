import 'package:desafio27/app/modules/home/home_page.dart';
import 'package:desafio27/app/modules/login/login_page.dart';
import 'package:desafio27/app/teste_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: TesteController.instance,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: Modular.navigatorKey,
            title: 'Flutter Slidy',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: TesteController.instance.isDarkTheme ? Brightness.dark : Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage(),
            },
          );
        });
  }
}
