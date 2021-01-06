import 'package:bloc_dynamic_theme/ui/global/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/global/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: state.themeData,
              home: HomePage(),
            );
          },
        ));
  }
}
