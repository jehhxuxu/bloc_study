import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_dynamic_theme/ui/global/theme/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  //appThemeData eh o enum, AppTheme.BlueLight eh um dos index do enum
  ThemeBloc() : super(ThemeState(themeData: appThemeData[AppTheme.GreenDark]));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ChangeThemeEvent) {
      //event.theme eh um dos index do enum appThemeData
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}
