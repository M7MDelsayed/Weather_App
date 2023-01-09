import 'package:flutter/material.dart';
import 'package:weather_app/Model/weather/weather_model.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    WeatherModel args =
        ModalRoute.of(context)?.settings.arguments as WeatherModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: args.getThemeColor(),
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: args.getThemeColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              args.cityName ?? '',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("updated ${args.date}"),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(args.getImage()),
                Text(
                  "${args.temp?.toInt() ?? 0}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text("Max Temp : ${args.maxTemp?.toInt() ?? 0}"),
                    Text("Min Temp : ${args.minTemp?.toInt() ?? 0}"),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              args.weatherState ?? '',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
