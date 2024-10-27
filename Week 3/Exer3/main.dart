import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(10), 
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          oopContainer(),
          dartContainer(),
          flutterContainer(),
        ],
      ),
    ),
  ));
}

Widget oopContainer() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10), 
    decoration: BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text(
        "OOP",
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: 16, 
        ),
      ),
    ),
  );
}

Widget dartContainer() {
  var color = Colors.blue[300]; 
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text(
        "DART",
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget flutterContainer() {
  var textStyle = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.white,
    fontSize: 16,
  ); 
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.blue[600],
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text(
        "FLUTTER",
        style: textStyle,
      ),
    ),
  );
}
