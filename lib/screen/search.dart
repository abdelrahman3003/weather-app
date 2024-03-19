import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({super.key});
  String id = 'Search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onSubmitted: (value) {
              var weathercubit = BlocProvider.of<weatherCubit>(context);
              weathercubit.getweather(value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              hintText: "City",
              label: Text("Search"),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
