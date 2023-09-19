import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/getWeather%20cubit/get_weather_states.dart';
import 'package:weather_app/views/homeview.dart';

void main() {
  runApp(const WeatherApp());
}

DateTime stringToDateTime(String value) {
  return DateTime.parse(value);
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit , WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                  theme: ThemeData(
                    primarySwatch: getWeatherColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weather
                            ?.weatherStatus),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: const HomeView());
            },
          ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.purple;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy rain possible':
      return Colors.lightGreen;
    case 'Patchy snow possible':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
      return Colors.blue;
    case 'Patchy freezing drizzle possible':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.lightBlue;
    case 'Patchy light rain':
      return Colors.lightGreen;
    case 'Light rain':
      return Colors.lightGreen;
    case 'Moderate rain at times':
      return Colors.green;
    case 'Moderate rain':
      return Colors.green;
    case 'Heavy rain at times':
      return Colors.green;
    case 'Heavy rain':
      return Colors.indigo;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.blue;
    case 'Patchy light snow':
      return Colors.lightBlue;
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
      return Colors.blue;
    case 'Heavy snow':
    case 'Ice pellets':
      return Colors.lightBlue;
    case 'Light rain shower':
      return Colors.lightGreen;
    case 'Moderate or heavy rain shower':
      return Colors.green;
    case 'Torrential rain shower':
      return Colors.green;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.blue;
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate or heavy snow showers':
      return Colors.blue;
    case 'Light showers of ice pellets':
      return Colors.lightBlue;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'Patchy light rain with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
