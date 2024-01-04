import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final DateTime date;
  final String? image_state;
  final double temp;
  final double max_temp;
  final double min_temp;
  final String status;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.image_state,
      required this.temp,
      required this.max_temp,
      required this.min_temp,
      required this.status});

  factory WeatherModel.froJson(json) {
    return WeatherModel(
        city: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        image_state: json['forecast']['forecastday'][0]['day']['condition']
            ['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        max_temp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        min_temp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        status: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
  MaterialColor getmaterialcolor() {
    switch (status) {
      case 'Sunny':
        return Colors.yellow;
      case 'Cloudy':
        return Colors.grey;
      case 'Rainy':
        return Colors.blue;
      case 'Snowy':
        return Colors.cyan;
      case 'Foggy':
        return Colors.deepPurple;
      case 'Windy':
        return Colors.orange;
      case 'Partly cloudy"':
        return Colors.indigo;
      case 'Partly cloudy':
        return Colors.lightBlue;
      case 'Hazy':
        return Colors.teal;
      case 'Thunderstorm':
        return Colors.deepOrange;
      case 'Sleet':
        return Colors.indigo;
      case 'Dusty':
        return Colors.amber;
      case 'Misty':
        return Colors.cyan;
      case 'Hot':
        return Colors.orange;
      case 'cold':
        return Colors.blueGrey;
      case 'freezing':
        return Colors.lightBlue;
      default:
        return Colors.blueGrey;
    }
  }
}
