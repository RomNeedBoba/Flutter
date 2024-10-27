import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Container(
    padding: const EdgeInsets.all(50),
    margin: const EdgeInsets.all(40),
    color: Colors.blue[300],
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          "CADT STUDENS",
          style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              decoration: TextDecoration.none),
        ),
      ),
    ),
  )));
}
