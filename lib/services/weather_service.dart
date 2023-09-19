import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{

  const WeatherService({required this.dio});

  final Dio dio;

  final String apiKey = '482909210fe942ababe145129230909';
  final String baseUrl = 'http://api.weatherapi.com/v1';

  Future<Weather> getCurrentWeather(String cityName) async {
    try{

      Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      return Weather.fromjson(response.data);
    }
    on DioException catch (e){
      final String errorMessage;

      if(e.response != null){
        errorMessage = e.response!.data['error']['message'];
      }
      else{
        errorMessage = 'Error Api Page not found';
      }

      throw Exception(errorMessage);
    } 
    catch(e){
      log(e.toString());
      throw Exception('Error: Try Later');
    }
  }
} 