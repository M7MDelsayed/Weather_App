import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/api/api_manager.dart';
import 'package:weather_app/Model/weather/weather_model.dart';
import 'package:weather_app/Providers/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search';
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherModel? weather = await ApiManager.getWeather(cityName);
              provider.weatherData = weather;
              provider.cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Enter a City",
              label: const Text("Search"),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              suffixIcon: IconButton(
                onPressed: () async {
                  WeatherModel? weather = await ApiManager.getWeather(cityName);
                  provider.weatherData = weather;
                  provider.cityName = cityName;
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
