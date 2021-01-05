import 'dart:math';

import 'package:bloc_fake_weather/bloc/weather_bloc.dart';
import 'package:bloc_fake_weather/model/weather.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ignore: close_sinks
  WeatherBloc weatherBloc;
  setUp(() {
    weatherBloc = WeatherBloc();
  });
  test("city cannot be empty", () async {
    //expect(weatherBloc.add(GetWeatherEvent('')), isA<WeatherError>());
  });
}
