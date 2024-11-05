import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.lightBlue[50],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  DailyForecast(
                    condition: WeatherType.Clear,
                    temperature: [18, 5],
                    weekday: Weekday.Sun,
                  ),
                  SizedBox(width: 12),
                  DailyForecast(
                    condition: WeatherType.Rain,
                    temperature: [12, 4],
                    weekday: Weekday.Mon,
                  ),
                  SizedBox(width: 12),
                  DailyForecast(
                    condition: WeatherType.PartlyCloudy,
                    temperature: [14, 6],
                    weekday: Weekday.Tue,
                  ),
                  SizedBox(width: 12),
                  DailyForecast(
                    condition: WeatherType.Snow,
                    temperature: [2, -3],
                    weekday: Weekday.Wed,
                  ),
                  SizedBox(width: 12),
                  DailyForecast(
                    condition: WeatherType.Clear,
                    temperature: [18, 5],
                    weekday: Weekday.Thu,
                  ),
                  SizedBox(width: 12),
                  DailyForecast(
                    condition: WeatherType.Rain,
                    temperature: [12, 4],
                    weekday: Weekday.Fri,
                  ),
                  SizedBox(width: 12),
                  DailyForecast(
                    condition: WeatherType.PartlyCloudy,
                    temperature: [14, 6],
                    weekday: Weekday.Sat,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum WeatherType {
  Clear,
  Rain,
  PartlyCloudy,
  Snow,
}

enum Weekday {
  Mon, Tue, Wed, Thu, Fri, Sat, Sun
}

class DailyForecast extends StatelessWidget {
  const DailyForecast({
    super.key,
    required this.condition,
    required this.temperature,
    required this.weekday,
  });

  final WeatherType condition;
  final List<int> temperature;
  final Weekday weekday;

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon;
    Color iconTint;

    switch (condition) {
      case WeatherType.Clear:
        weatherIcon = Icons.wb_sunny;
        iconTint = Colors.orange;
        break;
      case WeatherType.Rain:
        weatherIcon = Icons.umbrella;
        iconTint = Colors.blueAccent;
        break;
      case WeatherType.PartlyCloudy:
        weatherIcon = Icons.cloud;
        iconTint = Colors.grey;
        break;
      case WeatherType.Snow:
        weatherIcon = Icons.ac_unit;
        iconTint = Colors.cyanAccent;
        break;
    }

    return Container(
      width: 130,
      height: 185,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekday.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            weatherIcon,
            color: iconTint,
            size: 80,
          ),
          const SizedBox(height: 8),
          Text(
            "${temperature[0]}° - ${temperature[1]}°",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
