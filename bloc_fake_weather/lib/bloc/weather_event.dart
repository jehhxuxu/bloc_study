part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]);
}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;

  GetWeatherEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
