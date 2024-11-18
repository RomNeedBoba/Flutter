import 'package:flutter/material.dart';
import 'welcomescreen.dart';
import 'temperaturescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EX 3 - Switching Screens',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/temperature': (context) => TemperatureScreen(),
      },
    );
  }
}
