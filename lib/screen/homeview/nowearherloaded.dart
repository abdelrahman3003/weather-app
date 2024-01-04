import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/states_weathers.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/screen/homeview/weatherloaded.dart';
import 'package:weather_app/screen/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WeatherApp"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Search();
                  },
                ));
              },
              icon: const Icon(
                Icons.search,
                size: 23,
                color: Colors.white,
              ))
        ],
      ),
      body: BlocBuilder<weatherCubit, weatherState>(
        builder: (context, state) {
          if (state is weatherloadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is weatherlSucessState) {
            return Weatherloaded(
              weatherModel: state.weatherModel,
            );
          } else if (state is weatherfailureState) {
            return const Center(child: Text("there is an Error , try again"));
          } else {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "There is no weather 😔  start searching now  ",
                style: TextStyle(fontSize: 16),
              )),
            );
          }
        },
      ),
    );
  }
}
