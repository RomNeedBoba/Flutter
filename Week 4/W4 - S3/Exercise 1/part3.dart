import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableButton(initiallySelected: false),
              SizedBox(height: 10),
              SelectableButton(initiallySelected: true),
              SizedBox(height: 10),
              SelectableButton(initiallySelected: false),
              SizedBox(height: 10),
              SelectableButton(initiallySelected: true),
            ],
          ),
        ),
      ),
   );
  }
}

class SelectableButton extends StatefulWidget {
  final bool initiallySelected;
  const SelectableButton({super.key, required this.initiallySelected});

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initiallySelected;
  }

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
