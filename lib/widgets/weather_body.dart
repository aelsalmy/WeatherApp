import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weather.cityName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
          ),
          Text('Updated at ${weather.dateAndTime.hour}:${weather.dateAndTime.minute}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(image: AssetImage('assets/images/clear.png')),
              Text('${weather.avgTemp.round()} °C',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('MaxTemp: ${weather.maxTemp.round()} °C',
                    style: const TextStyle(
                      fontSize: 14,
                    )
                  ),
                  Text('MinTemp: ${weather.minTemp.round()} °C',
                    style: const TextStyle(
                      fontSize: 14,
                    ), 
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(weather.weatherStatus,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )
          )
        ],
      )
    );
  }
}