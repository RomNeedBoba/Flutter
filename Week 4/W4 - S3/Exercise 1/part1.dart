import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 100),
            ),
            onPressed: () {},
            child: const Text("Not Selected"),
          ),
        ),
      ),
    );
  }
}
