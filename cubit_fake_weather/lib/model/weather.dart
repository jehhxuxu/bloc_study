import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;

  Weather({this.cityName, this.temperature});

  @override
  List<Object> get props => [cityName, temperature];

  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'temperature': temperature,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Weather(
      cityName: map['cityName'],
      temperature: map['temperature'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));
}
