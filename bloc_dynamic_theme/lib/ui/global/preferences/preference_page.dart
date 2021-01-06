import 'package:bloc_dynamic_theme/ui/global/theme/app_theme.dart';
import 'package:bloc_dynamic_theme/ui/global/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          var appTheme = AppTheme.values[index];
          return Card(
            child: ListTile(
              tileColor: appThemeData[appTheme].primaryColor,
              title: Text(
                appTheme.toString(),
                style: appThemeData[appTheme].textTheme.bodyText1,
              ),
              trailing: Icon(
                index.isEven ? Icons.lightbulb : Icons.lightbulb_outline_rounded,
              ),
              onTap: () => {
                BlocProvider.of<ThemeBloc>(context).add(
                  ChangeThemeEvent(theme: appTheme),
                )
              },
            ),
          );
        },
      ),
    );
  }
}
