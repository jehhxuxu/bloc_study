import 'package:bloc_fake_weather/bloc/weather_bloc.dart';
import 'package:bloc_fake_weather/model/weather.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ignore: close_sinks
  WeatherBloc weatherBloc;
  setUp(() {
    weatherBloc = WeatherBloc();
  });
  blocTest(
    'city cannot be empty with bloc',
    build: () => weatherBloc,
    act: (bloc) => weatherBloc.add(GetWeatherEvent('')),
    expect: [isA<WeatherError>()],
  );

  blocTest(
    'happy path with bloc',
    build: () => weatherBloc,
    act: (bloc) => weatherBloc.add(GetWeatherEvent('London')),
    expect: [isA<WeatherLoading>(), isA<WeatherLoaded>()],
  );
  test('city cannot be empty', () {
    weatherBloc.add(GetWeatherEvent(''));
    expectLater(weatherBloc, emitsInOrder([isA<WeatherError>()]));
  });
  test('happy path', () {
    weatherBloc.add(GetWeatherEvent('London'));
    expectLater(weatherBloc, emitsInOrder([isA<WeatherLoading>(), isA<WeatherLoaded>()]));
  });

  test('happy path fetchWeatherFromFakeApi', () async {
    var weatherResponse = await weatherBloc.fetchWeatherFromFakeApi('London');
    expectLater(weatherResponse, isA<Weather>());
  });
}
