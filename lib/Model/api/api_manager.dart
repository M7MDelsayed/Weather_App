import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather/weather_model.dart';

class ApiManager {
  static const String apiKey = '36b86cdd6a60410c8a4180812230701';
  static const String baseUrl = 'api.weatherapi.com';

  static Future<WeatherModel?> getWeather(String cityName) async {
    WeatherModel? weatherData;
    try {
      var url = Uri.http(baseUrl, '/v1/forecast.json',
          {"key": apiKey, "q": cityName, "days": "3"});
      var response = await http.get(url);
      weatherData = WeatherModel.fromJson(
        jsonDecode(response.body),
      );
    } catch (error) {
      print(error);
    }
    return weatherData;
  }
}
