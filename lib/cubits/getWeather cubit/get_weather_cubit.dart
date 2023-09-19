import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/cubits/getWeather%20cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_service.dart';
import '../../models/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherState>
{
  GetWeatherCubit() : super(NoWeatherState());

  Weather? weather;

  getWeather(String cityName) async {
    try {
      weather = await WeatherService(dio: Dio()).getCurrentWeather(cityName);
  
      emit(WeatherLoadedState());
    } 
    catch (e) {
      emit(WeatherErrorState());
    }
  }
}