import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/wearther_model.dart';

class Weatherloaded extends StatelessWidget {
  const Weatherloaded({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        BlocProvider.of<weatherCubit>(context).weatherModel!.getmaterialcolor(),
        Colors.white
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                weatherModel.city,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'updated at : ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: NetworkImage("http:${weatherModel.image_state!}"),
                height: 90,
                width: 90,
                fit: BoxFit.fill,
              ),
              Text(
                "${weatherModel.temp.round()}",
                style: TextStyle(fontSize: 28),
              ),
              Column(
                children: [
                  Text(
                    "max  : ${weatherModel.max_temp.round()}",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "min  : ${weatherModel.min_temp.round()}",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            weatherModel.status,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
