import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({super.key});
  String id = 'Search';
  TextEditingController textEditingController = TextEditingController();
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
            controller: textEditingController,
            onSubmitted: (value) {
              var weathercubit = BlocProvider.of<weatherCubit>(context);
              weathercubit.getweather(value);

              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  var weathercubit = BlocProvider.of<weatherCubit>(context);
                  weathercubit.getweather(textEditingController.text);

                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.search, size: 30),
                color: Colors.blue,
              ),
              hintText: "City",
              label: const Text("Search"),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              enabledBorder: const OutlineInputBorder(
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
