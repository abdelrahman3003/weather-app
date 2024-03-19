import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/states_weathers.dart';

import 'package:weather_app/models/wearther_model.dart';
import 'package:weather_app/services/weather_service.dart';

class weatherCubit extends Cubit<weatherState> {
  weatherCubit() : super(weatherInitState());
  WeatherModel? weatherModel;
  getweather(String city) async {

      emit(weatherloadingState());
      weatherModel = await WeatherService().getWeather(city);

      emit(weatherlSucessState(weatherModel: weatherModel!));
      emit(weatherfailureState());
    
  }
}
