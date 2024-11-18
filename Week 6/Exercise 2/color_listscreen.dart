import 'package:flutter/material.dart';

class ColorListScreen extends StatelessWidget {
  final List<String> colors = ["Red", "Blue", "Green"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color List'),
      ),
      body: ListView(
        children: colors
            .map((color) => ListTile(
                  title: Text(color),
                ))
            .toList(),
      ),
    );
  }
}
