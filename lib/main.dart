import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/states_weathers.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/screen/homeview/nowearherloaded.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => weatherCubit(),
    child: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<weatherCubit, weatherState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch:
                  BlocProvider.of<weatherCubit>(context).weatherModel == null
                      ? Colors.blue
                      : BlocProvider.of<weatherCubit>(context)
                          .weatherModel!
                          .getmaterialcolor()),
          home: HomePage(),
        );
      },
    );
  }
}
