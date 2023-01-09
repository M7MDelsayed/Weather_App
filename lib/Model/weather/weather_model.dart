import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherState;
  String? cityName;
  String? image;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.cityName,
    this.image,
  });

  WeatherModel.fromJson(Map<String, dynamic> json)
      : this(
          cityName: json['location']['name'],
          date: json['location']['localtime'],
          temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
          maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
          minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
          weatherState: json['forecast']['forecastday'][0]['day']['condition']
              ['text'],
        );

  String getImage() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherState == 'Partly cloudy' ||
        weatherState == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers' ||
        weatherState == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Thunderstorm' || weatherState == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return Colors.blue;
    } else if (weatherState == 'Partly cloudy' ||
        weatherState == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers' ||
        weatherState == 'Moderate rain') {
      return Colors.blue;
    } else if (weatherState == 'Thunderstorm' || weatherState == 'Thunder') {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }
}
