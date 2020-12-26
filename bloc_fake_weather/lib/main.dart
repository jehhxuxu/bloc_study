import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_bloc.dart';
import 'model/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Fake Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final weatherBloc = WeatherBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocProvider(
            create: (widget) => weatherBloc,
            child: Center(
              child: BlocBuilder(
                cubit: weatherBloc,
                builder: (context, WeatherState state) {
                  if (state is WeatherInitial) {
                    return CityInputField();
                  }
                  if (state is WeatherLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is WeatherLoaded) {
                    return weatherCompleteFields(state.weather);
                  }
                  return Container();
                },
              ),
            ),
          )),
    );
  }

  Widget weatherCompleteFields(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weather.cityName.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${weather.temperature.toStringAsFixed(1)} °C',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CityInputField(),
      ],
    );
  }

  @override
  dispose() {
    weatherBloc.close();
    super.dispose();
  }
}

class CityInputField extends StatefulWidget {
  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  var weatherBloc;
  @override
  void initState() {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    super.initState();
  }

  void submitCityName(String value) {
    weatherBloc.add(GetWeatherEvent(value));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onSubmitted: submitCityName,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Enter a city",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
