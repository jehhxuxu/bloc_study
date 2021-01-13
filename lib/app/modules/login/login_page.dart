import 'package:desafio27/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String _email = '';
    String _password = '';
    var mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: mediaQuerySize.width,
        height: mediaQuerySize.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.network(
                  'https://www.tapisrouge.com.br/wp-content/uploads/2019/11/Avengers-Logo-PNG-Transparent-Avengers-Logo-715x715.png',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (email) {
                  _email = email;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (password) {
                  _password = password;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {
                  if (_email == 'jessica' && _password == '123') {
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                },
                child: Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
