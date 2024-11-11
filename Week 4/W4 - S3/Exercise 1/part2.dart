import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: const Center(
          child: SelectableButton(),
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey,
        ),
        onPressed: () => setState(() => isSelected = !isSelected),
        child: Text(
          isSelected ? "Selected" : "Not selected",
          style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
