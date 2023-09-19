import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/getWeather%20cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return const SearchView();
                })
              );
            }, 
            icon: const Icon(Icons.search)
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit , WeatherState>(
        builder: (context , state){
          if(state is NoWeatherState){
            return const NoWeatherBody();
          }
          else if(state is WeatherLoadedState){
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weather?.weatherStatus)[300]!,
                    getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weather?.weatherStatus)[50]!,
                  ]
                )
              ),
              child: WeatherBody(weather: BlocProvider.of<GetWeatherCubit>(context).weather!),
              );
              
          }
          else{
            return const Text('Error Found: Try Again Later');
          }
        }
      )
    );
  }
}