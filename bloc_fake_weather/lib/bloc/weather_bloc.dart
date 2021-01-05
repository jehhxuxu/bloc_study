import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_fake_weather/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherEvent) {
      if (event.cityName.isEmpty) {
        yield WeatherError('Campo cidade nao pode ser vazio');
      } else {
        yield WeatherLoading();
        final weather = await fetchWeatherFromFakeApi(event.cityName);
        yield WeatherLoaded(weather);
      }
    }
  }

  Future<Weather> fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(Duration(seconds: 2), () {
      return Weather(
        cityName: cityName,
        temperature: 20 + Random().nextInt(15) + Random().nextDouble(),
      );
    });
  }
}
