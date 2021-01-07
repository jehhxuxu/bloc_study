import 'dart:async';
import 'dart:math';

import 'package:bloc_fake_weather/bloc/weather_errors.dart';
import 'package:bloc_fake_weather/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherEvent) {
      try {
        yield WeatherLoading();
        final weather = await fetchWeatherFromFakeApi(event.cityName);
        yield WeatherLoaded(weather);
      } catch (e) {
        if (e is EmptyCity) yield WeatherError('Campo cidade nao pode ser vazio');
        //yield WeatherError(e.toString());
      }
    }
  }

  Future<Weather> fetchWeatherFromFakeApi(String cityName) {
    if (cityName.isEmpty) return throw EmptyCity();
    return Future.delayed(Duration(seconds: 2), () {
      return Weather(
        cityName: cityName,
        temperature: 20 + Random().nextInt(15) + Random().nextDouble(),
      );
    });
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) {
    try {
      final weather = Weather.fromMap(json);
      return WeatherLoaded(weather);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(WeatherState state) {
    if (state is WeatherLoaded) {
      return state.weather.toMap();
    } else {
      return null;
    }
  }
}
