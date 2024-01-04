import 'package:weather_app/models/wearther_model.dart';

class weatherState {}

class weatherInitState extends weatherState {}

class weatherloadingState extends weatherState {}

class weatherlSucessState extends weatherState {
  WeatherModel weatherModel;

  weatherlSucessState({required this.weatherModel});
}

class weatherfailureState extends weatherState {}
