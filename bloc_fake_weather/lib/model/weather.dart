import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;

  Weather({this.cityName, this.temperature});

  @override
  List<Object> get props => [cityName, temperature];
}
