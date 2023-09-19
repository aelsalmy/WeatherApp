class Weather{
  final String weatherStatus;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String cityName;
  final DateTime dateAndTime;
  
  const Weather({required this.cityName, required this.dateAndTime, required this.avgTemp , required this.maxTemp , required this.minTemp , required this.weatherStatus , });

  factory Weather.fromjson(json){
    return Weather(
      cityName: json['location']['name'],
      dateAndTime: DateTime.parse(json['current']['last_updated']),
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'], 
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}