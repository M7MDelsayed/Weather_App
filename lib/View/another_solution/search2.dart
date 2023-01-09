import 'package:flutter/material.dart';
import 'package:weather_app/View/another_solution/home2.dart';

import '../../Model/api/api_manager.dart';

class Search extends StatelessWidget {
  static const String routeName = 'search-screen';
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              var weather = await ApiManager.getWeather(cityName);
              Navigator.pushNamed(context, Home.routeName, arguments: weather);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter a City",
              label: Text("Search"),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
