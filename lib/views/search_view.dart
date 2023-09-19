import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeather%20cubit/get_weather_cubit.dart';

import '../models/weather_model.dart';

Weather? currWeather;

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
             var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(value);
             Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 8.0),
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(
                  color: Colors.green
                )
              ),
              ),
          ),
        ),
      )
    );
  }
}